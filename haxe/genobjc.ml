(*
 *  haXe/Objective-C Compiler
 *  Copyright (c)2012 Băluță Cristian
 *  based on and including code by (c)2005-2008 Nicolas Cannasse and Hugh Sanderson
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *)
open Ast
open Type
open Common

let join_class_path path separator =
	let result = match fst path, snd path with
	| [], s -> s
	| el, s -> String.concat separator el ^ separator ^ s in
	if (String.contains result '+') then begin
		let idx = String.index result '+' in
		(String.sub result 0 idx) ^ (String.sub result (idx+1) ((String.length result) - idx -1 ) )
	end else
		result
;;

class sourceWriter write_func close_func =
	object(this)
	val indent_str = "\t"
	val mutable indent = ""
	val mutable indents = []
	val mutable just_finished_block = false
	method close = close_func(); ()
	method write str = write_func str; just_finished_block <- false
	(* method write (Printf.sprintf str = write_func str; just_finished_block <- false  (* Printf.ksprintf (fun s -> Buffer.add_string ctx.buf_m s) *) *)
	method indent_one = this#write indent_str

	method push_indent = indents <- indent_str::indents; indent <- String.concat "" indents
	method pop_indent = match indents with
							| h::tail -> indents <- tail; indent <- String.concat "" indents
							| [] -> indent <- "/*?*/";
	method write_i x = this#write (indent ^ x)
	method get_indent = indent
	method begin_block = this#write ("{\n"); this#push_indent
	method end_block = this#pop_indent; this#write_i "}\n"; just_finished_block <- true
	method end_block_line = this#pop_indent; this#write_i "}"; just_finished_block <- true
	method terminate_line = this#write (if just_finished_block then "" else ";\n")
	method add_include class_path = this#write ("#import \"" ^ (join_class_path class_path "/") ^ ".h\"\n")
	(* TODO: import only the name of the class, not the entire path *)
end;;


let fileSourceWriter filename =
	let out_file = open_out filename in
	new sourceWriter (output_string out_file) (fun ()-> close_out out_file)
	(* output_string (channel) (string) *)
;;

let readWholeFile chan = Std.input_all chan;;

let rec makeClassDirectories base dir_list =
	( match dir_list with
	| [] -> ()
	| dir :: remaining ->
		let path = match base with
                   | "" ->  dir
                   | "/" -> "/" ^ dir
                   | _ -> base ^ "/" ^ dir  in
         if ( not ( (path="") ||
           ( ((String.length path)=2) && ((String.sub path 1 1)=":") ) ) ) then
		         if not (Sys.file_exists path) then
			          Unix.mkdir path 0o755;
		makeClassDirectories (if (path="") then "/" else path) remaining
	)
;;

let cachedSourceWriter filename =
	try
		let in_file = open_in filename in
		let old_contents = readWholeFile in_file in
		close_in in_file;
		let buffer = Buffer.create 0 in
		let add_buf str = Buffer.add_string buffer str in
		let close = fun () ->
			let contents = Buffer.contents buffer in
			if (not (contents=old_contents) ) then begin
				let out_file = open_out filename in
				output_string out_file contents;
				close_out out_file;
			end;
		in
		new sourceWriter (add_buf) (close);
	with _ ->
		fileSourceWriter filename
;;

let newSourceFile base_dir class_path extension =
	makeClassDirectories base_dir ("" :: (fst class_path));
	cachedSourceWriter (base_dir ^ "/" ^ ( String.concat "/" (fst class_path) ) ^ "/" ^ (snd class_path) ^ extension);;

let newImplementationFile base_dir class_path = newSourceFile base_dir class_path ".m";;
let newHeaderFile base_dir class_path = newSourceFile base_dir class_path ".h";;
let makeBaseDirectory file = makeClassDirectories "" ( ( Str.split_delim (Str.regexp "[\\/]+") file ) );;


(* Objective-C code generation context *)

type context = {
	com : Common.context;
	mutable ctx_file_info : (string,string) PMap.t ref;
	mutable writer : sourceWriter;
	mutable get_sets : (string * bool,string) Hashtbl.t;
	mutable curclass : tclass;
	mutable tabs : string;
	mutable in_value : tvar option;
	mutable in_static : bool;
	mutable handleBreak : bool;
	mutable imports : (string,string list list) Hashtbl.t;
	mutable gen_uid : int;
	mutable local_types : t list;
	mutable constructor_block : bool;
	mutable block_inits : (unit -> unit) option;
}
let newContext common_ctx writer file_info = {
	com = common_ctx;
	ctx_file_info = file_info;
	writer = writer;
	get_sets = Hashtbl.create 0;
	curclass = null_class;
	tabs = "";
	in_value = None;
	in_static = false;
	handleBreak = false;
	imports = Hashtbl.create 0;
	gen_uid = 0;
	local_types = [];
	constructor_block = false;
	block_inits = None;
}

let isVarField e v =
	match e.eexpr, follow e.etype with
	| TTypeExpr (TClassDecl c),_
	| _,TInst(c,_) ->
		(try
			let f = try PMap.find v c.cl_fields	with Not_found -> PMap.find v c.cl_statics in
			(match f.cf_kind with Var _ -> true | _ -> false)
		with Not_found -> false)
	| _ -> false
;;

let isSpecialCompare e1 e2 =
	match e1.eexpr, e2.eexpr with
	| TConst TNull, _  | _ , TConst TNull -> None
	| _ ->
	match follow e1.etype, follow e2.etype with
	| TInst ({ cl_path = [],"Xml" } as c,_) , _ | _ , TInst ({ cl_path = [],"Xml" } as c,_) -> Some c
	| _ -> None
;;

let protect name =
	match name with
	| "Error" | "Namespace" -> "_" ^ name
	| _ -> name
;;

(* This is generating a special path ? *)
let s_path ctx stat path p =
	match path with
	| ([],name) ->
		(match name with
		| "Int" -> "NSNumber"
		| "Float" -> "NSNumber"
		| "Dynamic" -> "NSDictionary"
		| "Bool" -> "BOOL"
		| "String" -> "NSString"
		| "Array" -> "NSMutableArray"
		| _ -> name)
	| (["objc"],"FlashXml__") -> "Xml"
	| (["flash";"errors"],"Error") -> "Error"
	| (["flash"],"Vector") -> "Vector"
	| (["objc";"ios"],"XML") -> "XML"
	| (["haxe"],"Int32") when not stat -> "int"
	| (pack,name) ->
		let name = protect name in
		let packs = (try Hashtbl.find ctx.imports name with Not_found -> []) in
		if not (List.mem pack packs) then Hashtbl.replace ctx.imports name (pack :: packs);
		Ast.s_type_path (pack,name)
;;
	
let reserved =
	let h = Hashtbl.create 0 in
	List.iter (fun l -> Hashtbl.add h l ())
	(* these ones are defined in order to prevent recursion in some Std functions *)
	["is";"as";"int";"uint";"const";"getTimer";"typeof";"parseInt";"parseFloat";
	(* AS3 keywords which are not Haxe ones *)
	"finally";"with";"final";"internal";"native";"namespace";"include";"delete";
	(* some globals give some errors with Flex SDK as well *)
	"print";"trace";
	(* we don't include get+set since they are not 'real' keywords, but they can't be used as method names *)
	"function";"class";"var";"if";"else";"while";"do";"for";"break";"continue";"return";"extends";"implements";
	"import";"switch";"case";"default";"static";"public";"private";"try";"catch";"new";"this";"throw";"interface";
	"override";"package";"null";"true";"false";"void"
	];
	h

	(* "each", "label" : removed (actually allowed in locals and fields accesses) *)
;;

let s_ident n =
	if Hashtbl.mem reserved n then "_" ^ n else n

let rec createDirectory acc = function
	| [] -> ()
	| d :: l ->
		let dir = String.concat "/" (List.rev (d :: acc)) in
		if not (Sys.file_exists dir) then Unix.mkdir dir 0o755;
		createDirectory (d :: acc) l
;;

let saveLocals ctx =
	(fun() -> ())
		
let genLocal ctx l =
	ctx.gen_uid <- ctx.gen_uid + 1;
	if ctx.gen_uid = 1 then l else l ^ string_of_int ctx.gen_uid
;;

let unsupported p = error "This expression cannot be generated to Objective-C" p

let newLine ctx =
	ctx.writer#write "\n"
	(* let rec loop p =
		match Buffer.nth ctx.buf_m p with
		| '}' | '{' | ':' -> ctx.writer#write ("\n" ^ tabs)
		| '\n' | '\t' -> loop (p - 1)
		| _ -> ctx.writer#write (";\n" ^ ctx.tabs)
	in
	loop (Buffer.length ctx.buf_m - 1) *)
;;

let rec concat ctx s f = function
	| [] -> ()
	| [x] -> f x
	| x :: l ->
		f x;
		ctx.writer#write s;
		concat ctx s f l
;;

let openBlock ctx =
	(fun() -> ctx.writer#begin_block)
	(* let oldt = ctx.tabs in
	ctx.tabs <- "\t" ^ ctx.tabs;
	(fun() -> ctx.tabs <- oldt) *)
;;

let parent e =
	match e.eexpr with
	| TParenthesis _ -> e
	| _ -> mk (TParenthesis e) e.etype e.epos
;;

let defaultValue tstr =
	match tstr with
	| "Boolean" -> "NO"
	| _ -> "nil"
;;

let rec typeStr ctx t p =
	match t with
	| TEnum _ | TInst _ when List.memq t ctx.local_types ->
		"*"
	| TAbstract (a,_) ->
		(match a.a_path with
		| [], "Void" -> "void"
		| [], "UInt" -> "NSNumber"
		| [], "Int" -> "NSNumber"
		| [], "Float" -> "NSNumber"
		| [], "Bool" -> "BOOL"
		| _ -> s_path ctx true a.a_path p)
	| TEnum (e,_) ->
		if e.e_extern then (match e.e_path with
			| [], "Void" -> "void"
			| [], "Bool" -> "BOOL"
			| _ ->
				let rec loop = function
					| [] -> "Object"
					| (":fakeEnum",[Ast.EConst (Ast.Ident n),_],_) :: _ ->
						(match n with
						| "Int" -> "int"
						| "UInt" -> "uint"
						| _ -> n)
					| _ :: l -> loop l
				in
				loop e.e_meta
		) else
			s_path ctx true e.e_path p
	| TInst ({ cl_path = ["flash"],"Vector" },[pt]) ->
		(match pt with
		| TInst({cl_kind = KTypeParameter _},_) -> "*"
		| _ -> "Vector.<" ^ typeStr ctx pt p ^ ">")
	| TInst (c,_) ->
		(match c.cl_kind with
		| KNormal | KGeneric | KGenericInstance _ -> s_path ctx false c.cl_path p
		| KTypeParameter _ | KExtension _ | KExpr _ | KMacroType -> "*")
	| TFun _ ->
		"Function"
	| TMono r ->
		(match !r with None -> "*" | Some t -> typeStr ctx t p)
	| TAnon _ | TDynamic _ ->
		"*"
	| TType (t,args) ->
		(match t.t_path with
		| [], "UInt" -> "uint"
		| [] , "Null" ->
			(match args with
			| [t] ->
				(match follow t with
				| TAbstract ({ a_path = [],"UInt" },_)
				| TAbstract ({ a_path = [],"Int" },_)
				| TAbstract ({ a_path = [],"Float" },_)
				| TAbstract ({ a_path = [],"Bool" },_)
				| TInst ({ cl_path = [],"Int" },_)
				| TInst ({ cl_path = [],"Float" },_)
				| TEnum ({ e_path = [],"Bool" },_) -> "*"
				| _ -> typeStr ctx t p)
			| _ -> assert false);
		| _ -> typeStr ctx (apply_params t.t_types args t.t_type) p)
	| TLazy f ->
		typeStr ctx ((!f)()) p
;;

let rec iterSwitchBreak in_switch e =
	match e.eexpr with
	| TFunction _ | TWhile _ | TFor _ -> ()
	| TSwitch _ | TMatch _ when not in_switch -> iterSwitchBreak true e
	| TBreak when in_switch -> raise Exit
	| _ -> iter (iterSwitchBreak in_switch) e
;;

let handleBreak ctx e =
	let old_handle = ctx.handleBreak in
	try
		iterSwitchBreak false e;
		ctx.handleBreak <- false;
		(fun() -> ctx.handleBreak <- old_handle)
	with
		Exit ->
			ctx.writer#write "try {";
			let b = openBlock ctx in
			newLine ctx;
			ctx.handleBreak <- true;
			(fun() ->
				b();
				ctx.handleBreak <- old_handle;
				newLine ctx;
				ctx.writer#write "} catch( e : * ) { if( e != \"__break__\" ) throw e; }";
			)
;;
		
let this ctx = if ctx.in_value <> None then "$this" else "this"

let escapeBin s =
	let b = Buffer.create 0 in
	for i = 0 to String.length s - 1 do
		match Char.code (String.unsafe_get s i) with
		| c when c < 32 -> Buffer.add_string b (Printf.sprintf "\\x%.2X" c)
		| c -> Buffer.add_char b (Char.chr c)
	done;
	Buffer.contents b
;;

(* TODO: Generate resources that Objective-C can understand *)
(* Put texts in a .plist file
Put images in the resources directory *)

let generateResources common_ctx =
	if Hashtbl.length common_ctx.resources <> 0 then begin
		let dir = (common_ctx.file :: ["Resources"]) in
		createDirectory [] dir;
		
		let resource_file = newImplementationFile common_ctx.file ([],"__resources__") in
		resource_file#write "#include <xxx.h>\n\n";
		
		(* let add_resource name data =
			let ch = open_out_bin (String.concat "/" (dir @ [name])) in
			output_string ch data;
			close_out ch
		in
		Hashtbl.iter (fun name data -> add_resource name data) infos.com.resources;
		let ctx = init infos ([],"__resources__") in
		ctx.writer#write "\timport flash.utils.Dictionary;\n";
		ctx.writer#write "\tpublic class __resources__ {\n";
		ctx.writer#write "\t\tpublic static var list:Dictionary;\n";
		let inits = ref [] in
		let k = ref 0 in
		Hashtbl.iter (fun name _ ->
			let varname = ("v" ^ (string_of_int !k)) in
			k := !k + 1;
			ctx.writer#write (Printf.sprintf "\t\t[Embed(source = \"__res/%s\", mimeType = \"application/octet-stream\")]\n" name;
			ctx.writer#write (Printf.sprintf "\t\tpublic static var %s:Class;\n" varname;
			inits := ("list[\"" ^name^ "\"] = " ^ varname ^ ";") :: !inits;
		) infos.com.resources;
		ctx.writer#write "\t\tstatic public function __init__():void {\n";
		ctx.writer#write "\t\t\tlist = new Dictionary();\n";
		List.iter (fun init ->
			ctx.writer#write (Printf.sprintf "\t\t\t%s\n" init
		) !inits;
		ctx.writer#write "\t\t}\n";
		ctx.writer#write "\t}\n";
		ctx.writer#write "}"; *)
		(* close ctx; *)
	end
;;

let generateConstant ctx p = function
	| TInt i -> ctx.writer#write (Printf.sprintf "[NSNumber numberWithInt:%ld]" i) (* %ld = int32 *)(* (Int32.to_string i) *)
	(* | TFloat s -> ctx.writer#write (Printf.sprintf "[NSNumber numberWithFloat:%s]" s *)
	| TFloat f -> ctx.writer#write f
	| TString s -> ctx.writer#write (Printf.sprintf "@\"%s\"" (Ast.s_escape s)) (* "@\"" ^ (escapeBin (Ast.s_escape s)) ^ "\"" *)
	| TBool b -> ctx.writer#write (if b then "YES" else "NO")
	| TNull -> ctx.writer#write "nil"
	| TThis -> ctx.writer#write "self"
	(* | TThis -> ctx.writer#write (Printf.sprintf this ctx) *)
	| TSuper -> ctx.writer#write "super"
;;

(* A function header in objc is a message *)
(* Get the parameters and make a human readable phrase from them *)
let generateFunctionHeader ctx name f params p =
	let old = ctx.in_value in
	let locals = saveLocals ctx in
	let old_t = ctx.local_types in
	ctx.in_value <- None;
	ctx.local_types <- List.map snd params @ ctx.local_types;
	ctx.writer#write (Printf.sprintf "(%s*)" (typeStr ctx f.tf_type p));(* Print the return type of the function *)
	ctx.writer#write (Printf.sprintf "%s" (match name with None -> "" | Some (n,meta) ->
		let rec loop = function
			| [] -> n
			| _ :: l -> loop l
		in
		" " ^ loop meta
	));
	concat ctx " " (fun (v,c) ->
		let tstr = typeStr ctx v.v_type p in
		ctx.writer#write (Printf.sprintf "%s:(%s%s)%s" (s_ident v.v_name) tstr "*" (s_ident v.v_name));
		match c with
		| None ->
			if ctx.constructor_block then ctx.writer#write (Printf.sprintf " = %s" (defaultValue tstr));
		| Some c ->
			ctx.writer#write " = ";
			generateConstant ctx p c
	) f.tf_args;
	(fun () ->
		ctx.in_value <- old;
		locals();
		ctx.local_types <- old_t;
	)
;;

let rec generateCall ctx e el r =
	match e.eexpr , el with
	| TCall (x,_) , el ->
		ctx.writer#write "(";
		generateValue ctx e;
		ctx.writer#write ")";
		ctx.writer#write "(";
		concat ctx "," (generateValue ctx) el;
		ctx.writer#write ")";
	| TLocal { v_name = "__is__" } , [e1;e2] ->
		generateValue ctx e1;
		ctx.writer#write " is ";
		generateValue ctx e2;
	| TLocal { v_name = "__as__" }, [e1;e2] ->
		generateValue ctx e1;
		ctx.writer#write " as ";
		generateValue ctx e2;
	| TLocal { v_name = "__int__" }, [e] ->
		ctx.writer#write "int(";
		generateValue ctx e;
		ctx.writer#write ")";
	| TLocal { v_name = "__float__" }, [e] ->
		ctx.writer#write "Number(";
		generateValue ctx e;
		ctx.writer#write ")";
	| TLocal { v_name = "__typeof__" }, [e] ->
		ctx.writer#write "typeof ";
		generateValue ctx e;
	| TLocal { v_name = "__keys__" }, [e] ->
		let ret = (match ctx.in_value with None -> assert false | Some r -> r) in
		ctx.writer#write (Printf.sprintf "%s = [[NSMutableArray alloc] init]" ret.v_name);
		newLine ctx;
		let tmp = genLocal ctx "$k" in
		ctx.writer#write (Printf.sprintf "for (NSString *%s in " tmp);
		generateValue ctx e;
		ctx.writer#write (Printf.sprintf "[%s addObject : %s ]" ret.v_name tmp);
	| TLocal { v_name = "__hkeys__" }, [e] ->
		let ret = (match ctx.in_value with None -> assert false | Some r -> r) in
		ctx.writer#write (Printf.sprintf "%s = [[NSMutableArray alloc] init]" ret.v_name);
		newLine ctx;
		let tmp = genLocal ctx "$k" in
		ctx.writer#write (Printf.sprintf "for (NSString *%s in " tmp);
		generateValue ctx e;
		ctx.writer#write (Printf.sprintf ") [%s addObject : %s.substr(1)]" ret.v_name tmp);
	| TLocal { v_name = "__foreach__" }, [e] ->
		let ret = (match ctx.in_value with None -> assert false | Some r -> r) in
		ctx.writer#write (Printf.sprintf "%s = [[NSMutableArray alloc] init]" ret.v_name);
		newLine ctx;
		let tmp = genLocal ctx "$k" in
		ctx.writer#write (Printf.sprintf "for ( %s : * in " tmp);
		generateValue ctx e;
		ctx.writer#write (Printf.sprintf ") [%s addObject : %s]" ret.v_name tmp);
	| TLocal { v_name = "__new__" }, e :: args ->
		ctx.writer#write "[[";
		generateValue ctx e;
		ctx.writer#write " alloc] init]";
		concat ctx "," (generateValue ctx) args;(* Generate an expression from parameters *)
		ctx.writer#write ")";
	| TLocal { v_name = "__delete__" }, [e;f] ->
		ctx.writer#write "delete(";
		generateValue ctx e;
		ctx.writer#write "[";
		generateValue ctx f;
		ctx.writer#write "]";
		ctx.writer#write ")";
	| TLocal { v_name = "__unprotect__" }, [e] ->
		generateValue ctx e
	| TLocal { v_name = "__vector__" }, [e] ->
		ctx.writer#write (typeStr ctx r e.epos);
		ctx.writer#write "(";
		generateValue ctx e;
		ctx.writer#write ")"
	| TField(ee,v),args when isVarField ee v ->
		ctx.writer#write "(";
		generateValue ctx e;
		ctx.writer#write ")";
		ctx.writer#write "(";
		concat ctx "," (generateValue ctx) el;
		ctx.writer#write ")"	
	| _ ->
		generateValue ctx e;
		ctx.writer#write "[";
		concat ctx " " (generateValue ctx) el;
		ctx.writer#write "]"
	
and generateValueOp ctx e =
	match e.eexpr with
	| TBinop (op,_,_) when op = Ast.OpAnd || op = Ast.OpOr || op = Ast.OpXor ->
		ctx.writer#write "(";
		generateValue ctx e;
		ctx.writer#write ")";
	| _ ->
		generateValue ctx e

and generateFieldAccess ctx t s =
	let field c =
		match fst c.cl_path, snd c.cl_path, s with
		| [], "Math", "NaN"
		| [], "Math", "NEGATIVE_INFINITY"
		| [], "Math", "POSITIVE_INFINITY"
		| [], "Math", "isFinite"
		| [], "Math", "isNaN"
		| [], "Date", "now"
		| [], "Date", "fromTime"
		| [], "Date", "fromString" -> ctx.writer#write (Printf.sprintf "[\"%s\"]" s)
		| [], "String", "charCodeAt" -> ctx.writer#write "[\"charCodeAtHX\"]"
		| [], "Date", "toString" -> ctx.writer#write "[\"toStringHX\"]"
		| [], "String", "cca" -> ctx.writer#write ".charCodeAt"
		| ["flash";"xml"], "XML", "namespace" -> ctx.writer#write (Printf.sprintf ".namespace")
		| _ -> ctx.writer#write (Printf.sprintf ".%s" (s_ident s))
	in
	match follow t with
	| TInst (c,_) -> field c
	| TAnon a ->
		(match !(a.a_status) with
		| Statics c -> field c
		| _ -> ctx.writer#write (Printf.sprintf ".%s" (s_ident s)))
	| _ ->
		ctx.writer#write (Printf.sprintf ".%s" (s_ident s))
	
and generateExpression ctx e =
	match e.eexpr with
	| TConst c ->
		generateConstant ctx e.epos c
	| TLocal v ->
		ctx.writer#write (s_ident v.v_name)
	| TEnumField (en,s) ->
		ctx.writer#write (Printf.sprintf "%s.%s" (s_path ctx true en.e_path e.epos) (s_ident s))
	| TArray ({ eexpr = TLocal { v_name = "__global__" } },{ eexpr = TConst (TString s) }) ->
		let path = Ast.parse_path s in
		ctx.writer#write (s_path ctx false path e.epos)
	| TArray (e1,e2) ->
		generateValue ctx e1;
		ctx.writer#write "[";
		generateValue ctx e2;
		ctx.writer#write "]";
	| TBinop (Ast.OpEq,e1,e2) when (match isSpecialCompare e1 e2 with Some c -> true | None -> false) ->
		let c = match isSpecialCompare e1 e2 with Some c -> c | None -> assert false in
		generateExpression ctx (mk (TCall (mk (TField (mk (TTypeExpr (TClassDecl c)) t_dynamic e.epos,"compare")) t_dynamic e.epos,[e1;e2])) ctx.com.basic.tbool e.epos);
	(* what is this used for? *)
(* 	| TBinop (op,{ eexpr = TField (e1,s) },e2) ->
		generateValueOp ctx e1;
		generateFieldAccess ctx e1.etype s;
		ctx.writer#write (Printf.sprintf " %s " (Ast.s_binop op);
		generateValueOp ctx e2; *)
	| TBinop (op,e1,e2) ->
		generateValueOp ctx e1;
		ctx.writer#write (Printf.sprintf " %s " (Ast.s_binop op));
		generateValueOp ctx e2;
	(* variable fields on interfaces are generated as (class["field"] as class) *)
	| TField ({etype = TInst({cl_interface = true} as c,_)} as e,s)
	| TClosure ({etype = TInst({cl_interface = true} as c,_)} as e,s)
		when (try (match (PMap.find s c.cl_fields).cf_kind with Var _ -> true | _ -> false) with Not_found -> false) ->
		ctx.writer#write "(";
		generateValue ctx e;
		ctx.writer#write (Printf.sprintf "[\"%s\"]" s);
		ctx.writer#write (Printf.sprintf " as %s)" (typeStr ctx e.etype e.epos));		
	| TField (e,s) | TClosure (e,s) ->
   		generateValue ctx e;
		generateFieldAccess ctx e.etype s
	| TTypeExpr t ->
		ctx.writer#write (s_path ctx true (t_path t) e.epos)
	| TParenthesis e ->
		ctx.writer#write "(";
		generateValue ctx e;
		ctx.writer#write ")";
	| TReturn eo ->
		if ctx.in_value <> None then unsupported e.epos;
		(match eo with
		| None ->
			ctx.writer#write "return"
		| Some e when (match follow e.etype with TEnum({ e_path = [],"Void" },[]) | TAbstract ({ a_path = [],"Void" },[]) -> true | _ -> false) ->
			ctx.writer#write "{";
			let bend = openBlock ctx in
			newLine ctx;
			generateValue ctx e;
			newLine ctx;
			ctx.writer#write "return";
			bend();
			newLine ctx;
			ctx.writer#write "}";
		| Some e ->
			ctx.writer#write "return ";
			generateValue ctx e);
	| TBreak ->
		if ctx.in_value <> None then unsupported e.epos;
		if ctx.handleBreak then ctx.writer#write "throw \"__break__\"" else ctx.writer#write "break"
	| TContinue ->
		if ctx.in_value <> None then unsupported e.epos;
		ctx.writer#write "continue"
	| TBlock expr_list ->
		ctx.writer#begin_block;
		List.iter (fun e ->
			generateExpression ctx e;
			ctx.writer#terminate_line
		) expr_list;
		ctx.writer#end_block;
	| TFunction f ->
		let h = generateFunctionHeader ctx None f [] e.epos in
		let old = ctx.in_static in
		ctx.in_static <- true;
		generateExpression ctx f.tf_expr;
		ctx.in_static <- old;
		h();
	| TCall (v,el) ->
		generateCall ctx v el e.etype
	| TArrayDecl el ->
		ctx.writer#write "[";
		concat ctx "," (generateValue ctx) el;
		ctx.writer#write "]"
	| TThrow e ->
		ctx.writer#write "throw ";
		generateValue ctx e;
	| TVars [] ->
		()
	| TVars vl ->
		(* ctx.writer#write "var "; *)
		concat ctx "; " (fun (v,eo) ->
			ctx.writer#write (Printf.sprintf "%s* %s" (typeStr ctx v.v_type e.epos) (s_ident v.v_name));
			match eo with
			| None -> ()
			| Some e ->
				ctx.writer#write " = ";
				generateValue ctx e
		) vl;
	| TNew (c,params,el) ->
		(match c.cl_path, params with
		| (["flash"],"Vector"), [pt] -> ctx.writer#write (Printf.sprintf "new Vector.<%s>(" (typeStr ctx pt e.epos))
		| _ -> ctx.writer#write (Printf.sprintf "[[%s alloc] init]" (s_path ctx true c.cl_path e.epos));
		concat ctx "," (generateValue ctx) el)
	| TIf (cond,e,eelse) ->
		ctx.writer#write "if";
		generateValue ctx (parent cond);
		ctx.writer#write " ";
		generateExpression ctx e;
		(match eelse with
		| None -> ()
		| Some e ->
			newLine ctx;
			ctx.writer#write "else ";
			generateExpression ctx e);
	| TUnop (op,Ast.Prefix,e) ->
		ctx.writer#write (Ast.s_unop op);
		generateValue ctx e
	| TUnop (op,Ast.Postfix,e) ->
		generateValue ctx e;
		ctx.writer#write (Ast.s_unop op)
	| TWhile (cond,e,Ast.NormalWhile) ->
		let handleBreak = handleBreak ctx e in
		ctx.writer#write "while";
		generateValue ctx (parent cond);
		ctx.writer#write " ";
		generateExpression ctx e;
		handleBreak();
	| TWhile (cond,e,Ast.DoWhile) ->
		let handleBreak = handleBreak ctx e in
		ctx.writer#write "do ";
		generateExpression ctx e;
		ctx.writer#write " while";
		generateValue ctx (parent cond);
		handleBreak();
	| TObjectDecl fields ->
		ctx.writer#write "{ ";
		concat ctx ", " (fun (f,e) -> ctx.writer#write (Printf.sprintf "%s : " (s_ident f)); generateValue ctx e) fields;
		ctx.writer#write "}"
	| TFor (v,it,e) ->
		ctx.writer#begin_block;
		let handleBreak = handleBreak ctx e in
		let tmp = genLocal ctx "$it" in
		ctx.writer#write (Printf.sprintf "{ var %s : * = " tmp);
		generateValue ctx it;
		newLine ctx;
		ctx.writer#write (Printf.sprintf "for ( %s.hasNext() ) { var %s : %s = %s.next()" tmp (s_ident v.v_name) (typeStr ctx v.v_type e.epos) tmp);
		newLine ctx;
		generateExpression ctx e;
		newLine ctx;
		ctx.writer#end_block;(* write "}}"; *)
		handleBreak();
	| TTry (e,catchs) ->
		ctx.writer#write "try ";
		generateExpression ctx e;
		List.iter (fun (v,e) ->
			newLine ctx;
			ctx.writer#write (Printf.sprintf "catch( %s : %s )" (s_ident v.v_name) (typeStr ctx v.v_type e.epos));
			generateExpression ctx e;
		) catchs;
	| TMatch (e,_,cases,def) ->
		ctx.writer#write "{";
		let bend = openBlock ctx in
		newLine ctx;
		let tmp = genLocal ctx "$e" in
		ctx.writer#write (Printf.sprintf "var %s : enum = " tmp);
		generateValue ctx e;
		newLine ctx;
		ctx.writer#write (Printf.sprintf "switch( %s.index ) {" tmp);
		List.iter (fun (cl,params,e) ->
			List.iter (fun c ->
				newLine ctx;
				ctx.writer#write (Printf.sprintf "case %d:" c);
			) cl;
			(match params with
			| None | Some [] -> ()
			| Some l ->
				let n = ref (-1) in
				let l = List.fold_left (fun acc v -> incr n; match v with None -> acc | Some v -> (v,!n) :: acc) [] l in
				match l with
				| [] -> ()
				| l ->
					newLine ctx;
					ctx.writer#write "var ";
					concat ctx ", " (fun (v,n) ->
						ctx.writer#write (Printf.sprintf "%s : %s = %s.params[%d]" (s_ident v.v_name) (typeStr ctx v.v_type e.epos) tmp n);
					) l);
			generateBlock ctx e;
			ctx.writer#write "break";
		) cases;
		(match def with
		| None -> ()
		| Some e ->
			newLine ctx;
			ctx.writer#write "default:";
			generateBlock ctx e;
			ctx.writer#write "break";
		);
		newLine ctx;
		ctx.writer#write "}";
		bend();
		newLine ctx;
		ctx.writer#write "}";
	| TSwitch (e,cases,def) ->
		ctx.writer#write "switch"; generateValue ctx (parent e); ctx.writer#write " {";
		newLine ctx;
		List.iter (fun (el,e2) ->
			List.iter (fun e ->
				ctx.writer#write "case "; generateValue ctx e; ctx.writer#write ":";
			) el;
			generateBlock ctx e2;
			ctx.writer#write "break;";
			newLine ctx;
		) cases;
		(match def with
		| None -> ()
		| Some e ->
			ctx.writer#write "default:";
			generateBlock ctx e;
			ctx.writer#write "break";
			newLine ctx;
		);
		ctx.writer#write "}"
	| TCast (e1,None) ->
		ctx.writer#write "((";
		generateExpression ctx e1;
		ctx.writer#write (Printf.sprintf ") as %s)" (typeStr ctx e.etype e.epos));
	| TCast (e1,Some t) ->
		generateExpression ctx (Codegen.default_cast ctx.com e1 t e.etype e.epos)

and generateBlock ctx e =
	newLine ctx;
	match e.eexpr with
	| TBlock [] -> ()
	| _ -> generateExpression ctx e;
		newLine ctx
	
and generateValue ctx e =
	let assign e =
		mk (TBinop (Ast.OpAssign,
			mk (TLocal (match ctx.in_value with None -> assert false | Some r -> r)) t_dynamic e.epos,
			e
		)) e.etype e.epos
	in
	let block e =
		mk (TBlock [e]) e.etype e.epos
	in
	let value block =
		let old = ctx.in_value in
		let t = typeStr ctx e.etype e.epos in
		let r = alloc_var (genLocal ctx "$r") e.etype in
		ctx.in_value <- Some r;
		if ctx.in_static then
			ctx.writer#write (Printf.sprintf "- (%s*) " t)
		else
			ctx.writer#write (Printf.sprintf "((%s)($this:%s) " t "(snd ctx.path)");
		let b = if block then begin
			(* ctx.writer#write "{"; *)
			ctx.writer#begin_block;
			let b = openBlock ctx in
			newLine ctx;
			ctx.writer#write (Printf.sprintf "%s* %s" t r.v_name);
			ctx.writer#end_block;
			newLine ctx;
			b
		end else
			(fun() -> ())
		in
		(fun() ->
			if block then begin
				newLine ctx;
				ctx.writer#write (Printf.sprintf "return %s" r.v_name);
				b();
				newLine ctx;
				ctx.writer#write "}";
			end;
			ctx.in_value <- old;
			if ctx.in_static then
				ctx.writer#write "()"
			else
				ctx.writer#write (Printf.sprintf "(%s))" (this ctx))
		)
	in
	match e.eexpr with
	| TCall ({ eexpr = TLocal { v_name = "__keys__" } },_) | TCall ({ eexpr = TLocal { v_name = "__hkeys__" } },_) ->
		let v = value true in
		generateExpression ctx e;
		v()
	| TConst _
	| TLocal _
	| TEnumField _
	| TArray _
	| TBinop _
	| TField _
	| TClosure _
	| TTypeExpr _
	| TParenthesis _
	| TObjectDecl _
	| TArrayDecl _
	| TCall _
	| TNew _
	| TUnop _
	| TFunction _ ->
		generateExpression ctx e
	| TCast (e1,t) ->
		generateValue ctx (match t with None -> e1 | Some t -> Codegen.default_cast ctx.com e1 t e.etype e.epos)
	| TReturn _
	| TBreak
	| TContinue ->
		unsupported e.epos
	| TVars _
	| TFor _
	| TWhile _
	| TThrow _ ->
		(* value is discarded anyway *)
		let v = value true in
		generateExpression ctx e;
		v()
	| TBlock [] ->
		ctx.writer#write "nil"
	| TBlock [e] ->
		generateValue ctx e
	| TBlock el ->
		let v = value true in
		let rec loop = function
			| [] ->
				ctx.writer#write "return nil";
			| [e] ->
				generateExpression ctx (assign e);
			| e :: l ->
				generateExpression ctx e;
				newLine ctx;
				loop l
		in
		loop el;
		v();
	| TIf (cond,e,eo) ->
		ctx.writer#write "(";
		generateValue ctx cond;
		ctx.writer#write "?";
		generateValue ctx e;
		ctx.writer#write ":";
		(match eo with
		| None -> ctx.writer#write "nil"
		| Some e -> generateValue ctx e);
		ctx.writer#write ")"
	| TSwitch (cond,cases,def) ->
		let v = value true in
		generateExpression ctx (mk (TSwitch (cond,
			List.map (fun (e1,e2) -> (e1,assign e2)) cases,
			match def with None -> None | Some e -> Some (assign e)
		)) e.etype e.epos);
		v()
	| TMatch (cond,enum,cases,def) ->
		let v = value true in
		generateExpression ctx (mk (TMatch (cond,enum,
			List.map (fun (constr,params,e) -> (constr,params,assign e)) cases,
			match def with None -> None | Some e -> Some (assign e)
		)) e.etype e.epos);
		v()
	| TTry (b,catchs) ->
		let v = value true in
		generateExpression ctx (mk (TTry (block (assign b),
			List.map (fun (v,e) -> v, block (assign e)) catchs
		)) e.etype e.epos);
		v()

let final m = if has_meta ":final" m then "final " else ""

let generateField ctx static f =
	newLine ctx;
	ctx.in_static <- static;
	ctx.gen_uid <- 0;
	List.iter (fun(m,pl,_) ->
		match m,pl with
		| ":meta", [Ast.ECall ((Ast.EConst (Ast.Ident n),_),args),_] ->
			let mk_arg (a,p) =
				match a with
				| Ast.EConst (Ast.String s) -> (None, s)
				| Ast.EBinop (Ast.OpAssign,(Ast.EConst (Ast.Ident n),_),(Ast.EConst (Ast.String s),_)) -> (Some n, s)
				| _ -> error "Invalid meta definition" p
			in
			ctx.writer#write (Printf.sprintf "[%s" n);
			(match args with
			| [] -> ()
			| _ ->
				ctx.writer#write "---";
				concat ctx "," (fun a ->
					match mk_arg a with
					| None, s -> generateConstant ctx (snd a) (TString s)
					| Some s, e -> ctx.writer#write (Printf.sprintf "%s=" s); generateConstant ctx (snd a) (TString e)
				) args;
				ctx.writer#write ")");
			ctx.writer#write "]";
		| _ -> ()
	) f.cf_meta;
	
	let public = f.cf_public || Hashtbl.mem ctx.get_sets (f.cf_name,static) || (f.cf_name = "main" && static) || f.cf_name = "resolve" || has_meta ":public" f.cf_meta in
	let rights = (if static then "+" else "-") in
	let p = ctx.curclass.cl_pos in
	match f.cf_expr, f.cf_kind with
	| Some { eexpr = TFunction fd }, Method (MethNormal | MethInline) ->
		ctx.writer#write (Printf.sprintf "%s%s " rights (if static then "" else final f.cf_meta));
		let rec loop c =
			match c.cl_super with
			| None -> ()
			| Some (c,_) ->
				if PMap.mem f.cf_name c.cl_fields then
					ctx.writer#write "override "
				else
					loop c
		in
		if not static then loop ctx.curclass;
		let h = generateFunctionHeader ctx (Some (s_ident f.cf_name, f.cf_meta)) fd f.cf_params p in
		generateExpression ctx fd.tf_expr;
		h();
		newLine ctx;
		ctx.writer#write "\n"
	| _ ->
		let is_getset = (match f.cf_kind with Var { v_read = AccCall _ } | Var { v_write = AccCall _ } -> true | _ -> false) in
		if ctx.curclass.cl_interface then
			match follow f.cf_type with
			| TFun (args,r) ->
				let rec loop = function
					| [] -> f.cf_name
					| (":getter",[Ast.EConst (Ast.String name),_],_) :: _ -> "get " ^ name
					| (":setter",[Ast.EConst (Ast.String name),_],_) :: _ -> "set " ^ name
					| _ :: l -> loop l
				in
				ctx.writer#write (Printf.sprintf "(%s*) %s_" (typeStr ctx r p) (loop f.cf_meta));
				concat ctx " " (fun (arg,o,t) ->
					let tstr = typeStr ctx t p in
					ctx.writer#write (Printf.sprintf "%s:(%s*)%s" arg tstr arg);
					(* if o then ctx.writer#write (Printf.sprintf " = %s" (defaultValue tstr)); *)
				) args;
				ctx.writer#write ";";
				
			| _ when is_getset ->
				let t = typeStr ctx f.cf_type p in
				let id = s_ident f.cf_name in
				(match f.cf_kind with
				| Var v ->
					(match v.v_read with
					| AccNormal -> ctx.writer#write (Printf.sprintf "- get_%s() : %s;" id t);
					| AccCall s -> ctx.writer#write (Printf.sprintf "- %s() : %s;" s t);
					| _ -> ());
					(match v.v_write with
					| AccNormal -> ctx.writer#write (Printf.sprintf "- set_%s( __v : %s ) : void;" id t);
					| AccCall s -> ctx.writer#write (Printf.sprintf "- %s( __v : %s ) : %s;" s t t);
					| _ -> ());
				| _ -> assert false)
			| _ -> ()
		else
		let gen_init () = match f.cf_expr with
			| None -> ()
			| Some e ->
				ctx.writer#write " = ";
				generateValue ctx e
		in
		if is_getset then begin
			let t = typeStr ctx f.cf_type p in
			let id = s_ident f.cf_name in
			let v = (match f.cf_kind with Var v -> v | _ -> assert false) in
			(match v.v_read with
			| AccNormal ->
				ctx.writer#write (Printf.sprintf "%s function get %s() : %s { return $%s; }" rights id t id);
				newLine ctx
			| AccCall m ->
				ctx.writer#write (Printf.sprintf "%s function get %s() : %s { return %s(); }" rights id t m);
				newLine ctx
			| AccNo | AccNever ->
				ctx.writer#write (Printf.sprintf "%s function get %s() : %s { return $%s; }" (if v.v_read = AccNo then "protected" else "private") id t id);
				newLine ctx
			| _ ->
				());
			(match v.v_write with
			| AccNormal ->
				ctx.writer#write (Printf.sprintf "%s function set %s( __v : %s ) : void { $%s = __v; }" rights id t id);
				newLine ctx
			| AccCall m ->
				ctx.writer#write (Printf.sprintf "%s function set %s( __v : %s ) : void { %s(__v); }" rights id t m);
				newLine ctx
			| AccNo | AccNever ->
				ctx.writer#write (Printf.sprintf "%s function set %s( __v : %s ) : void { $%s = __v; }" (if v.v_write = AccNo then "protected" else "private") id t id);
				newLine ctx
			| _ -> ());
			ctx.writer#write (Printf.sprintf "%sprotected var $%s : %s" (if static then "static " else "") (s_ident f.cf_name) (typeStr ctx f.cf_type p));
			gen_init()
		end else begin
			ctx.writer#write (Printf.sprintf "%s var %s : %s" rights (s_ident f.cf_name) (typeStr ctx f.cf_type p));
			gen_init()
		end
;;

let generateProperty ctx static f =
	
	()
;;

let rec defineGetSet ctx is_static c =
	let def f name =
		Hashtbl.add ctx.get_sets (name,is_static) f.cf_name
	in
	let field f =
		match f.cf_kind with
		| Method _ -> ()
		| Var v ->
			(match v.v_read with AccCall m -> def f m | _ -> ());
			(match v.v_write with AccCall m -> def f m | _ -> ())
	in
	List.iter field (if is_static then c.cl_ordered_statics else c.cl_ordered_fields);
	match c.cl_super with
	| Some (c,_) when not is_static -> defineGetSet ctx is_static c
	| _ -> ()
;;




(* Generate header + implementation *)

let generateClassFiles common_ctx class_def file_info =
	
	if not class_def.cl_interface then begin
	
	(* Create the implementation file *)
	let base_dir = common_ctx.file in
	let sub_dir = match common_ctx.main_class with
		| Some path -> (snd path)
		| _ -> "Application" in
	let class_path = class_def.cl_path in
	let class_name = (snd class_def.cl_path) in
	let m_file = newImplementationFile (base_dir ^ "/" ^ sub_dir) class_path in
	let output_m = (m_file#write) in
	let ctx = newContext common_ctx m_file file_info in
	ctx.curclass <- class_def;
	
	defineGetSet ctx true class_def;
	defineGetSet ctx false class_def;
	(* common_ctx.local_types <- List.map snd c.cl_types; *)
	
	let pack = openBlock ctx in
	output_m ("#import \"" ^ (snd class_def.cl_path) ^ ".h\"\n\n");
	output_m ("@implementation " ^ (snd class_def.cl_path) ^ "\n\n");
	
	let cl = openBlock ctx in
	(match class_def.cl_constructor with
	| None -> ()
	| Some f ->
		let f = { f with
			cf_name = snd class_def.cl_path;
			cf_public = true;
			cf_kind = Method MethNormal;
		} in
		ctx.constructor_block <- true;
		generateField ctx false f;
	);
	
	List.iter (generateField ctx true) class_def.cl_ordered_statics;
	List.iter (generateField ctx false) class_def.cl_ordered_fields;
	
	cl();
	pack();
	newLine ctx;
	output_m "@end\n";
	m_file#close
	
	end;
	
	
	(* Create the header file *)
	
	let base_dir = common_ctx.file in
	let sub_dir = match common_ctx.main_class with
		| Some path -> (snd path)
		| _ -> "Application" in
	let class_path = class_def.cl_path in
	let class_name = (snd class_def.cl_path) in
	let h_file = newHeaderFile (base_dir ^ "/" ^ sub_dir) class_path in
	let output_h = (h_file#write) in
	let ctx = newContext common_ctx h_file file_info in
	ctx.curclass <- class_def;
	
	defineGetSet ctx true class_def;
	defineGetSet ctx false class_def;
	newLine ctx;
	(* (snd c.cl_path) returns the class name *)
	output_h "#import <UIKit/UIKit.h>\n\n";
	Hashtbl.iter (fun name paths ->
		List.iter (fun pack ->
			let path = pack, name in
			(* if path <> ctx.path then  *)output_h ("#import " ^ (Ast.s_type_path path) ^ "\n")
		) paths
	) ctx.imports;
	output_h ("\n@interface " ^ (snd class_def.cl_path));
	(* Add the super class *)
	(match class_def.cl_super with
		| None -> ()
		(* | Some (csup,_) -> output_h (Printf.sprintf " : %s " (s_path ctx true csup.cl_path class_def.cl_pos))); *)
		| Some (csup,_) -> output_h (Printf.sprintf " : %s " (snd csup.cl_path)));
	(* ctx.writer#write (Printf.sprintf "\npublic %s%s%s %s " (final c.cl_meta) (match c.cl_dynamic with None -> "" | Some _ -> if c.cl_interface then "" else "dynamic ") (if c.cl_interface then "interface" else "class") (snd c.cl_path); *)
	output_h "<";
	(match class_def.cl_implements with
		| [] -> ()
		| l ->
			(* output_h (if class_def.cl_interface then "extends " else "<implement something here> "); *)
			(* concat ctx ", " (fun (i,_) -> output_h (Printf.sprintf "<%s>" (s_path ctx true i.cl_path class_def.cl_pos))) l); *)
			concat ctx ", " (fun (i,_) -> output_h (Printf.sprintf "%s" (snd i.cl_path))) l);
	output_h ">";
	output_h "\n\n";
	
	List.iter (generateProperty ctx true) class_def.cl_ordered_statics;
	List.iter (generateProperty ctx false) class_def.cl_ordered_fields;
	
	output_h "\n\n@end\n";
	h_file#close
;;




(* GENERATE THE PROJECT DEFAULT FILES AND DIRECTORIES *)

let generateProjectStructure common_ctx = 
	let base_dir = common_ctx.file in
	let sub_dir = match common_ctx.main_class with
		| Some path -> (snd path)
		| _ -> "Application" in
	(* Create classes directory *)
	makeClassDirectories base_dir ( sub_dir :: []);
	makeClassDirectories base_dir ( sub_dir :: ["en.lproj"]);
	(* Create tests directory *)
	makeClassDirectories base_dir ( (sub_dir^"Tests") :: []);
	(* Create project file *)
	makeClassDirectories base_dir ( (sub_dir^".xcodeproj") :: [])
;;

let generateMain common_ctx class_def =

	let base_dir = common_ctx.file in
	let sub_dir = match common_ctx.main_class with
		| Some path -> (snd path)
		| _ -> "Application" in
	let class_path = class_def.cl_path in
	let class_name = (snd class_def.cl_path) in
	let generate_file filename =
		let m_file = newImplementationFile base_dir ([sub_dir],filename) in
		let output_main = (m_file#write) in
		
		output_main ("//
//  main.m
//  " ^ class_name ^ "
//
//  Source generated by Haxe Objective-C target
//

#import <UIKit/UIKit.h>
#import \"" ^ class_name ^ ".h\"

int main(int argc, char *argv[]) {
	@autoreleasepool {
		return UIApplicationMain(argc, argv, nil, NSStringFromClass([" ^ class_name ^ " class]));
	}
}");
		m_file#close;
	in
	generate_file "main"
;;
	
let generatePch common_ctx class_def  =

	let base_dir = common_ctx.file in
	let sub_dir = match common_ctx.main_class with
		| Some path -> (snd path)
		| _ -> "Application" in
	let generate_file =
		let file = newSourceFile base_dir ([sub_dir],sub_dir^"-Prefix") ".pch" in
		let output_pch = (file#write) in
		
		output_pch "//
// Prefix header for all source files in the project
//

#import <Availability.h>

#ifndef __IPHONE_4_0
#warning \"This project uses features only available in iOS SDK 4.0 and later.\"
#endif

#ifdef __OBJC__
	#import <UIKit/UIKit.h>
	#import <Foundation/Foundation.h>
#endif";
		file#close;
	in
	generate_file
;;

let generatePlist common_ctx class_def  =

	let base_dir = common_ctx.file in
	let sub_dir = match common_ctx.main_class with
		| Some path -> (snd path)
		| _ -> "Application" in
	let generate_file =
		let identifier = "ralcr.com" in
		let file = newSourceFile base_dir ([sub_dir],sub_dir^"-Info") ".plist" in
		let output_pch = (file#write) in
		
		output_pch ("<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>en</string>
	<key>CFBundleDisplayName</key>
	<string>${PRODUCT_NAME}</string>
	<key>CFBundleExecutable</key>
	<string>${EXECUTABLE_NAME}</string>
	<key>CFBundleIdentifier</key>
	<string>" ^ identifier ^ ".${PRODUCT_NAME:rfc1034identifier}</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>${PRODUCT_NAME}</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleShortVersionString</key>
	<string>1.0</string>
	<key>CFBundleSignature</key>
	<string>????</string>
	<key>CFBundleVersion</key>
	<string>1.0</string>
	<key>LSRequiresIPhoneOS</key>
	<true/>
	<key>UIRequiredDeviceCapabilities</key>
	<array>
		<string>armv7</string>
	</array>
	<key>UISupportedInterfaceOrientations</key>
	<array>
		<string>UIInterfaceOrientationPortrait</string>
		<string>UIInterfaceOrientationLandscapeLeft</string>
		<string>UIInterfaceOrientationLandscapeRight</string>
	</array>
</dict>
</plist>");
		file#close;
	in
	generate_file
;;

let generateEnum ctx e =
	()
;;

(* The main entry of the generator *)
let generate common_ctx =
	
	(* Generate folder structure and basic files *)
	generateProjectStructure common_ctx;
	generateResources common_ctx;
	
	(* let ctx = init infos ([],"enum") in
	generate_base_enum ctx;
	close ctx; *)
	
	(* makeBaseDirectory common_ctx.file; *)
	
	let debug = false in
	let exe_classes = ref [] in
	let boot_classes = ref [] in
	let init_classes = ref [] in
	let file_info = ref PMap.empty in
	let class_text path = join_class_path path "/" in
	(* let member_types = create_member_types common_ctx in *)
	(* let super_deps = create_super_dependencies common_ctx in *)
	(* let constructor_deps = create_constructor_dependencies common_ctx in *)
	(* let main_deps = ref [] in *)
	(* let build_xml = ref ""; *)
	
	
	let inits = ref [] in (*  ref means reference cell, editable *)
	List.iter (fun object_def ->
		match object_def with
		| TClassDecl class_def ->
			let class_def = (match class_def.cl_path with
				| ["flash"],"FlashXml__" -> { class_def with cl_path = [],"Xml" }
				| (pack,name) -> { class_def with cl_path = (pack,protect name) }
			) in
			(match class_def.cl_init with
			| None -> ()
			| Some e -> inits := e :: !inits);
				
			if class_def.cl_extern then
				()
			else
				generateClassFiles common_ctx class_def file_info
					
		| TEnumDecl e ->
			let pack,name = e.e_path in
			let e = { e with e_path = (pack,protect name) } in
			if e.e_extern then
				()
			else
				generateEnum common_ctx e
				
		| TTypeDecl _ | TAbstractDecl _ ->
			()
	) common_ctx.types;
		
	(* (match common_ctx.main with
		| None -> ()
		| Some e -> inits := e :: !inits); *)
	
	(match common_ctx.main with
	| None -> ()
	| Some e ->
		let main_field = { cf_name = "main"; cf_type = t_dynamic; cf_expr = Some e; cf_pos = e.epos; cf_public = true; cf_meta = []; cf_overloads = []; cf_doc = None; cf_kind = Var { v_read = AccNormal; v_write = AccNormal; }; cf_params = [] } in
		let class_def = { null_class with cl_path = ([],"AppDelegate"); cl_ordered_statics = [main_field] } in
		(* main_deps := find_referenced_types common_ctx (TClassDecl class_def) super_deps constructor_deps false true false; *)
		generateMain common_ctx class_def;
		generatePch common_ctx class_def;
		generatePlist common_ctx class_def
	)
;;
