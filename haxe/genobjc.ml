(*
 *  Haxe Compiler
 *  Copyright (c)2005-2007 Nicolas Cannasse
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
		result;;

class source_writer write_func close_func =
	object(this)
	val indent_str = "\t"
	val mutable indent = ""
	val mutable indents = []
	val mutable just_finished_block = false
	method close = close_func(); ()
	method write str = write_func str; just_finished_block <- false
	method write_format str = write_func str; just_finished_block <- false  (* Printf.ksprintf (fun s -> Buffer.add_string ctx.buf_m s) *)
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


let file_source_writer filename =
	let out_file = open_out filename in
	new source_writer (output_string out_file) (fun ()-> close_out out_file);;
	(* output_string (channel) (string) *)

let read_whole_file chan =
	Std.input_all chan;;

let rec make_class_directories base dir_list =
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
		make_class_directories (if (path="") then "/" else path) remaining
	);;

let new_source_file base_dir class_path extension =
	make_class_directories base_dir ("" :: (fst class_path));
	cached_source_writer (base_dir ^ "/" ^ ( String.concat "/" (fst class_path) ) ^ "/" ^ (snd class_path) ^ extension);;

let cached_source_writer filename =
	try
		let in_file = open_in filename in
		let old_contents = read_whole_file in_file in
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
		new source_writer (add_buf) (close);
	with _ ->
		file_source_writer filename;;
	
let new_m_file base_dir class_path = new_source_file base_dir class_path ".m";;
let new_h_file base_dir class_path = new_source_file base_dir class_path ".h";;
let make_base_directory file = make_class_directories "" ( ( Str.split_delim (Str.regexp "[\\/]+") file ) );

let new_placed_m_file common_ctx class_path =
	let base_dir = common_ctx.file in
	if (Common.defined common_ctx "vcproj" ) then begin
		make_class_directories base_dir (""::[]);
		cached_source_writer
			( base_dir ^ "/" ^ ( String.concat "-" (fst class_path) ) ^ "-" ^ (snd class_path) ^ ".m")
	end else
		new_m_file common_ctx.file class_path;;



(* Objective-C code generation context *)

type context = {
	inf : context_infos;
	path : path;
	com : Common.context;
	mutable writer : source_writer;
	mutable get_sets : (string * bool,string) Hashtbl.t;
	mutable curclass : tclass;
	mutable tabs : string;
	mutable in_value : tvar option;
	mutable in_static : bool;
	mutable handle_break : bool;
	mutable imports : (string,string list list) Hashtbl.t;
	mutable gen_uid : int;
	mutable local_types : t list;
	mutable constructor_block : bool;
	mutable block_inits : (unit -> unit) option;
}
let new_context common_ctx writer file_info = {
	inf = infos;
	path = path;
	com = common_ctx;
	writer = writer;
	get_sets = Hashtbl.create 0;
	curclass = null_class;
	tabs = "";
	in_value = None;
	in_static = false;
	handle_break = false;
	imports = imports;
	gen_uid = 0;
	local_types = [];
	constructor_block = false;
	block_inits = None;
}

let is_var_field e v =
	match e.eexpr, follow e.etype with
	| TTypeExpr (TClassDecl c),_
	| _,TInst(c,_) ->
		(try
			let f = try PMap.find v c.cl_fields	with Not_found -> PMap.find v c.cl_statics in
			(match f.cf_kind with Var _ -> true | _ -> false)
		with Not_found -> false)
	| _ -> false

let is_special_compare e1 e2 =
	match e1.eexpr, e2.eexpr with
	| TConst TNull, _  | _ , TConst TNull -> None
	| _ ->
	match follow e1.etype, follow e2.etype with
	| TInst ({ cl_path = [],"Xml" } as c,_) , _ | _ , TInst ({ cl_path = [],"Xml" } as c,_) -> Some c
	| _ -> None

let protect name =
	match name with
	| "Error" | "Namespace" -> "_" ^ name
	| _ -> name

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

let s_ident n =
	if Hashtbl.mem reserved n then "_" ^ n else n

let rec create_dir acc = function
	| [] -> ()
	| d :: l ->
		let dir = String.concat "/" (List.rev (d :: acc)) in
		if not (Sys.file_exists dir) then Unix.mkdir dir 0o755;
		create_dir (d :: acc) l


(* let close ctx =
	output_string ctx.ch_m (Printf.sprintf "//\n// File generated with the Haxe Objective-C target.\n//\n");
	output_string ctx.ch_h (Printf.sprintf "//\n// File generated with the Haxe Objective-C target.\n//\n");
	
	Hashtbl.iter (fun name paths ->
		List.iter (fun pack ->
			let path = pack, name in
			if path <> ctx.path then output_string ctx.ch_m ("#import " ^ Ast.s_type_path path ^ "\n");
		) paths
	) ctx.imports;
	
	output_string ctx.ch_m (Buffer.contents ctx.buf_m);
	output_string ctx.ch_h (Buffer.contents ctx.buf_h);
	
	close_out ctx.ch_m;
	close_out ctx.ch_h *)

let save_locals ctx =
	(fun() -> ())
		
let gen_local ctx l =
	ctx.gen_uid <- ctx.gen_uid + 1;
	if ctx.gen_uid = 1 then l else l ^ string_of_int ctx.gen_uid

let unsupported p = error "This expression cannot be generated to Objective-C" p

(* let newline ctx =
	let rec loop p =
		match Buffer.nth ctx.buf_m p with
		| '}' | '{' | ':' -> ctx.writer.write_format "\n%s" ctx.tabs
		| '\n' | '\t' -> loop (p - 1)
		| _ -> ctx.writer.write_format ";\n%s" ctx.tabs
	in
	loop (Buffer.length ctx.buf_m - 1) *)

let rec concat ctx s f = function
	| [] -> ()
	| [x] -> f x
	| x :: l ->
		f x;
		ctx.writer.write s;
		concat ctx s f l

let open_block ctx =
	let oldt = ctx.tabs in
	ctx.tabs <- "\t" ^ ctx.tabs;
	(fun() -> ctx.tabs <- oldt)

let parent e =
	match e.eexpr with
	| TParenthesis _ -> e
	| _ -> mk (TParenthesis e) e.etype e.epos

let default_value tstr =
	match tstr with
	| "Boolean" -> "NO"
	| _ -> "nil"

let rec type_str ctx t p =
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
		| _ -> "Vector.<" ^ type_str ctx pt p ^ ">")
	| TInst (c,_) ->
		(match c.cl_kind with
		| KNormal | KGeneric | KGenericInstance _ -> s_path ctx false c.cl_path p
		| KTypeParameter _ | KExtension _ | KExpr _ | KMacroType -> "*")
	| TFun _ ->
		"Function"
	| TMono r ->
		(match !r with None -> "*" | Some t -> type_str ctx t p)
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
				| _ -> type_str ctx t p)
			| _ -> assert false);
		| _ -> type_str ctx (apply_params t.t_types args t.t_type) p)
	| TLazy f ->
		type_str ctx ((!f)()) p

let rec iter_switch_break in_switch e =
	match e.eexpr with
	| TFunction _ | TWhile _ | TFor _ -> ()
	| TSwitch _ | TMatch _ when not in_switch -> iter_switch_break true e
	| TBreak when in_switch -> raise Exit
	| _ -> iter (iter_switch_break in_switch) e

let handle_break ctx e =
	let old_handle = ctx.handle_break in
	try
		iter_switch_break false e;
		ctx.handle_break <- false;
		(fun() -> ctx.handle_break <- old_handle)
	with
		Exit ->
			ctx.writer.write "try {";
			let b = open_block ctx in
			(* newline ctx; *)
			ctx.handle_break <- true;
			(fun() ->
				b();
				ctx.handle_break <- old_handle;
				(* newline ctx; *)
				ctx.writer.write "} catch( e : * ) { if( e != \"__break__\" ) throw e; }";
			)

let this ctx = if ctx.in_value <> None then "$this" else "this"

let escape_bin s =
	let b = Buffer.create 0 in
	for i = 0 to String.length s - 1 do
		match Char.code (String.unsafe_get s i) with
		| c when c < 32 -> Buffer.add_string b (Printf.sprintf "\\x%.2X" c)
		| c -> Buffer.add_char b (Char.chr c)
	done;
	Buffer.contents b


(* TODO: Generate resources that Objective-C can understand *)
let generate_resources infos =
	if Hashtbl.length infos.com.resources <> 0 then begin
		let dir = (infos.com.file :: ["__res"]) in
		create_dir [] dir;
		let add_resource name data =
			let ch = open_out_bin (String.concat "/" (dir @ [name])) in
			output_string ch data;
			close_out ch
		in
		Hashtbl.iter (fun name data -> add_resource name data) infos.com.resources;
		let ctx = init infos ([],"__resources__") in
		ctx.writer.write "\timport flash.utils.Dictionary;\n";
		ctx.writer.write "\tpublic class __resources__ {\n";
		ctx.writer.write "\t\tpublic static var list:Dictionary;\n";
		let inits = ref [] in
		let k = ref 0 in
		Hashtbl.iter (fun name _ ->
			let varname = ("v" ^ (string_of_int !k)) in
			k := !k + 1;
			ctx.writer.write_format "\t\t[Embed(source = \"__res/%s\", mimeType = \"application/octet-stream\")]\n" name;
			ctx.writer.write_format "\t\tpublic static var %s:Class;\n" varname;
			inits := ("list[\"" ^name^ "\"] = " ^ varname ^ ";") :: !inits;
		) infos.com.resources;
		ctx.writer.write "\t\tstatic public function __init__():void {\n";
		ctx.writer.write "\t\t\tlist = new Dictionary();\n";
		List.iter (fun init ->
			ctx.writer.write_format "\t\t\t%s\n" init
		) !inits;
		ctx.writer.write "\t\t}\n";
		ctx.writer.write "\t}\n";
		ctx.writer.write "}";
		(* close ctx; *)
	end

let gen_constant ctx p = function
	| TInt i -> ctx.writer.write_format "[NSNumber numberWithInt:%ld]" i(* %ld = int32 *)
	(* | TFloat s -> ctx.writer.write_format "[NSNumber numberWithFloat:%s]" s *)
	| TFloat f -> ctx.writer.write f
	| TString s -> ctx.writer.write_format "@\"%s\"" (escape_bin (Ast.s_escape s))
	| TBool b -> ctx.writer.write if b then "YES" else "NO"
	| TNull -> ctx.writer.write "nil"
	| TThis -> ctx.writer.write "self"
	(* | TThis -> ctx.writer.write_format this ctx) *)
	| TSuper -> ctx.writer.write "super"


(* A function header in objc is a message *)
(* Get the parameters and make a human readable phrase from them *)
let gen_function_header ctx name f params p =
	let old = ctx.in_value in
	let locals = save_locals ctx in
	let old_t = ctx.local_types in
	ctx.in_value <- None;
	ctx.local_types <- List.map snd params @ ctx.local_types;
	ctx.writer.write_format "(%s)" (type_str ctx f.tf_type p);(* Print the return type of the function *)
	ctx.writer.write_format "%s" (match name with None -> "" | Some (n,meta) ->
		let rec loop = function
			| [] -> n
			| _ :: l -> loop l
		in
		" " ^ loop meta
	);
	concat ctx " " (fun (v,c) ->
		let tstr = type_str ctx v.v_type p in
		ctx.writer.write_format "%s:(%s%s)%s" (s_ident v.v_name) tstr "*" (s_ident v.v_name);
		match c with
		| None ->
			if ctx.constructor_block then ctx.writer.write_format " = %s" (default_value tstr);
		| Some c ->
			ctx.writer.write " = ";
			gen_constant ctx p c
	) f.tf_args;
	(fun () ->
		ctx.in_value <- old;
		locals();
		ctx.local_types <- old_t;
	)


let rec gen_call ctx e el r =
	match e.eexpr , el with
	| TCall (x,_) , el ->
		ctx.writer.write "(";
		gen_value ctx e;
		ctx.writer.write ")";
		ctx.writer.write "(";
		concat ctx "," (gen_value ctx) el;
		ctx.writer.write ")";
	| TLocal { v_name = "__is__" } , [e1;e2] ->
		gen_value ctx e1;
		ctx.writer.write " is ";
		gen_value ctx e2;
	| TLocal { v_name = "__as__" }, [e1;e2] ->
		gen_value ctx e1;
		ctx.writer.write " as ";
		gen_value ctx e2;
	| TLocal { v_name = "__int__" }, [e] ->
		ctx.writer.write "int(";
		gen_value ctx e;
		ctx.writer.write ")";
	| TLocal { v_name = "__float__" }, [e] ->
		ctx.writer.write "Number(";
		gen_value ctx e;
		ctx.writer.write ")";
	| TLocal { v_name = "__typeof__" }, [e] ->
		ctx.writer.write "typeof ";
		gen_value ctx e;
	| TLocal { v_name = "__keys__" }, [e] ->
		let ret = (match ctx.in_value with None -> assert false | Some r -> r) in
		ctx.writer.write_format "%s = [[NSMutableArray alloc] init]" ret.v_name;
		(* newline ctx; *)
		let tmp = gen_local ctx "$k" in
		ctx.writer.write_format "for (NSString *"^tmp^" in ");
		gen_value ctx e;
		ctx.writer.write_format "[%s addObject : %s ]" ret.v_name tmp;
	| TLocal { v_name = "__hkeys__" }, [e] ->
		let ret = (match ctx.in_value with None -> assert false | Some r -> r) in
		ctx.writer.write_format "%s = [[NSMutableArray alloc] init]" ret.v_name;
		(* newline ctx; *)
		let tmp = gen_local ctx "$k" in
		ctx.writer.write_format "for (NSString *%s in " tmp;
		gen_value ctx e;
		ctx.writer.write_format ") [%s addObject : %s.substr(1)]" ret.v_name tmp;
	| TLocal { v_name = "__foreach__" }, [e] ->
		let ret = (match ctx.in_value with None -> assert false | Some r -> r) in
		ctx.writer.write_format "%s = [[NSMutableArray alloc] init]" ret.v_name;
		(* newline ctx; *)
		let tmp = gen_local ctx "$k" in
		ctx.writer.write_format "for ( %s : * in " tmp;
		gen_value ctx e;
		ctx.writer.write_format ") [%s addObject : %s]" ret.v_name tmp;
	| TLocal { v_name = "__new__" }, e :: args ->
		ctx.writer.write "[[";
		gen_value ctx e;
		ctx.writer.write " alloc] init]";
		concat ctx "," (gen_value ctx) args;(* Generate an expression from parameters *)
		ctx.writer.write ")";
	| TLocal { v_name = "__delete__" }, [e;f] ->
		ctx.writer.write "delete(";
		gen_value ctx e;
		ctx.writer.write "[";
		gen_value ctx f;
		ctx.writer.write "]";
		ctx.writer.write ")";
	| TLocal { v_name = "__unprotect__" }, [e] ->
		gen_value ctx e
	| TLocal { v_name = "__vector__" }, [e] ->
		ctx.writer.write_format type_str ctx r e.epos);
		ctx.writer.write "(";
		gen_value ctx e;
		ctx.writer.write ")"
	| TField(ee,v),args when is_var_field ee v ->
		ctx.writer.write "(";
		gen_value ctx e;
		ctx.writer.write ")";
		ctx.writer.write "(";
		concat ctx "," (gen_value ctx) el;
		ctx.writer.write ")"	
	| _ ->
		gen_value ctx e;
		ctx.writer.write "[";
		concat ctx " " (gen_value ctx) el;
		ctx.writer.write "]"

and gen_value_op ctx e =
	match e.eexpr with
	| TBinop (op,_,_) when op = Ast.OpAnd || op = Ast.OpOr || op = Ast.OpXor ->
		ctx.writer.write "(";
		gen_value ctx e;
		ctx.writer.write ")";
	| _ ->
		gen_value ctx e

and gen_field_access ctx t s =
	let field c =
		match fst c.cl_path, snd c.cl_path, s with
		| [], "Math", "NaN"
		| [], "Math", "NEGATIVE_INFINITY"
		| [], "Math", "POSITIVE_INFINITY"
		| [], "Math", "isFinite"
		| [], "Math", "isNaN"
		| [], "Date", "now"
		| [], "Date", "fromTime"
		| [], "Date", "fromString"
		->
			ctx.writer.write_format "[\"%s\"]" s
		| [], "String", "charCodeAt" ->
			ctx.writer.write "[\"charCodeAtHX\"]"
		| [], "Date", "toString" ->
			ctx.writer.write_format "[\"toStringHX\"]"
		| [], "String", "cca" ->
			ctx.writer.write_format ".charCodeAt"
		| ["flash";"xml"], "XML", "namespace" ->
			ctx.writer.write_format ".namespace"
		| _ ->
			ctx.writer.write_format ".%s" (s_ident s)
	in
	match follow t with
	| TInst (c,_) -> field c
	| TAnon a ->
		(match !(a.a_status) with
		| Statics c -> field c
		| _ -> ctx.writer.write_format ".%s" (s_ident s))
	| _ ->
		ctx.writer.write_format ".%s" (s_ident s)

and gen_expr ctx e =
	match e.eexpr with
	| TConst c ->
		gen_constant ctx e.epos c
	| TLocal v ->
		ctx.writer.write_format s_ident v.v_name)
	| TEnumField (en,s) ->
		ctx.writer.write_format "%s.%s" (s_path ctx true en.e_path e.epos) (s_ident s)
	| TArray ({ eexpr = TLocal { v_name = "__global__" } },{ eexpr = TConst (TString s) }) ->
		let path = Ast.parse_path s in
		ctx.writer.write_format s_path ctx false path e.epos)
	| TArray (e1,e2) ->
		gen_value ctx e1;
		ctx.writer.write "[";
		gen_value ctx e2;
		ctx.writer.write "]";
	| TBinop (Ast.OpEq,e1,e2) when (match is_special_compare e1 e2 with Some c -> true | None -> false) ->
		let c = match is_special_compare e1 e2 with Some c -> c | None -> assert false in
		gen_expr ctx (mk (TCall (mk (TField (mk (TTypeExpr (TClassDecl c)) t_dynamic e.epos,"compare")) t_dynamic e.epos,[e1;e2])) ctx.inf.com.basic.tbool e.epos);
	(* what is this used for? *)
(* 	| TBinop (op,{ eexpr = TField (e1,s) },e2) ->
		gen_value_op ctx e1;
		gen_field_access ctx e1.etype s;
		ctx.writer.write_format " %s " (Ast.s_binop op);
		gen_value_op ctx e2; *)
	| TBinop (op,e1,e2) ->
		gen_value_op ctx e1;
		ctx.writer.write_format " %s " (Ast.s_binop op);
		gen_value_op ctx e2;
	(* variable fields on interfaces are generated as (class["field"] as class) *)
	| TField ({etype = TInst({cl_interface = true} as c,_)} as e,s)
	| TClosure ({etype = TInst({cl_interface = true} as c,_)} as e,s)
		when (try (match (PMap.find s c.cl_fields).cf_kind with Var _ -> true | _ -> false) with Not_found -> false) ->
		ctx.writer.write "(";
		gen_value ctx e;
		ctx.writer.write_format "[\"%s\"]" s;
		ctx.writer.write_format " as %s)" (type_str ctx e.etype e.epos);		
	| TField (e,s) | TClosure (e,s) ->
   		gen_value ctx e;
		gen_field_access ctx e.etype s
	| TTypeExpr t ->
		ctx.writer.write_format s_path ctx true (t_path t) e.epos)
	| TParenthesis e ->
		ctx.writer.write "(";
		gen_value ctx e;
		ctx.writer.write ")";
	| TReturn eo ->
		if ctx.in_value <> None then unsupported e.epos;
		(match eo with
		| None ->
			ctx.writer.write "return"
		| Some e when (match follow e.etype with TEnum({ e_path = [],"Void" },[]) | TAbstract ({ a_path = [],"Void" },[]) -> true | _ -> false) ->
			ctx.writer.write_format "{";
			let bend = open_block ctx in
			(* newline ctx; *)
			gen_value ctx e;
			(* newline ctx; *)
			ctx.writer.write "return";
			bend();
			(* newline ctx; *)
			ctx.writer.write_format "}";			
		| Some e ->
			ctx.writer.write "return ";
			gen_value ctx e);
	| TBreak ->
		if ctx.in_value <> None then unsupported e.epos;
		if ctx.handle_break then ctx.writer.write "throw \"__break__\"" else ctx.writer.write "break"
	| TContinue ->
		if ctx.in_value <> None then unsupported e.epos;
		ctx.writer.write "continue"
	| TBlock el ->
		ctx.writer.write_format "{";
		let bend = open_block ctx in
		let cb = (if not ctx.constructor_block then
			(fun () -> ())
		else if not (Codegen.constructor_side_effects e) then begin
			ctx.constructor_block <- false;
			(fun () -> ())
		end else begin
			ctx.constructor_block <- false;
			ctx.writer.write_format " if( !%s.skip_constructor ) {" (s_path ctx true (["flash"],"Boot") e.epos);
            (fun() -> ctx.writer.write_format "}")
		end) in
		(match ctx.block_inits with None -> () | Some i -> i());
		List.iter (fun e -> (* newline ctx; *) gen_expr ctx e) el;
		bend();
		(* newline ctx; *)
		cb();
		ctx.writer.write_format "}";
	| TFunction f ->
		let h = gen_function_header ctx None f [] e.epos in
		let old = ctx.in_static in
		ctx.in_static <- true;
		gen_expr ctx f.tf_expr;
		ctx.in_static <- old;
		h();
	| TCall (v,el) ->
		gen_call ctx v el e.etype
	| TArrayDecl el ->
		ctx.writer.write "[";
		concat ctx "," (gen_value ctx) el;
		ctx.writer.write "]"
	| TThrow e ->
		ctx.writer.write "throw ";
		gen_value ctx e;
	| TVars [] ->
		()
	| TVars vl ->
		ctx.writer.write "var ";
		concat ctx ", " (fun (v,eo) ->
			ctx.writer.write_format "%s : %s" (s_ident v.v_name) (type_str ctx v.v_type e.epos);
			match eo with
			| None -> ()
			| Some e ->
				ctx.writer.write " = ";
				gen_value ctx e
		) vl;
	| TNew (c,params,el) ->
		(match c.cl_path, params with
		| (["flash"],"Vector"), [pt] -> ctx.writer.write_format "new Vector.<%s>(" (type_str ctx pt e.epos)
		| _ -> ctx.writer.write_format "new %s(" (s_path ctx true c.cl_path e.epos));
		concat ctx "," (gen_value ctx) el;
		ctx.writer.write ")"
	| TIf (cond,e,eelse) ->
		ctx.writer.write "if";
		gen_value ctx (parent cond);
		ctx.writer.write " ";
		gen_expr ctx e;
		(match eelse with
		| None -> ()
		| Some e ->
			(* newline ctx; *)
			ctx.writer.write "else ";
			gen_expr ctx e);
	| TUnop (op,Ast.Prefix,e) ->
		ctx.writer.write_format Ast.s_unop op);
		gen_value ctx e
	| TUnop (op,Ast.Postfix,e) ->
		gen_value ctx e;
		ctx.writer.write_format Ast.s_unop op)
	| TWhile (cond,e,Ast.NormalWhile) ->
		let handle_break = handle_break ctx e in
		ctx.writer.write "while";
		gen_value ctx (parent cond);
		ctx.writer.write " ";
		gen_expr ctx e;
		handle_break();
	| TWhile (cond,e,Ast.DoWhile) ->
		let handle_break = handle_break ctx e in
		ctx.writer.write "do ";
		gen_expr ctx e;
		ctx.writer.write " while";
		gen_value ctx (parent cond);
		handle_break();
	| TObjectDecl fields ->
		ctx.writer.write "{ ";
		concat ctx ", " (fun (f,e) -> ctx.writer.write_format "%s : " (s_ident f); gen_value ctx e) fields;
		ctx.writer.write "}"
	| TFor (v,it,e) ->
		let handle_break = handle_break ctx e in
		let tmp = gen_local ctx "$it" in
		ctx.writer.write_format "{ var %s : * = " tmp;
		gen_value ctx it;
		(* newline ctx; *)
		ctx.writer.write_format "while( %s.hasNext() ) { var %s : %s = %s.next()" tmp (s_ident v.v_name) (type_str ctx v.v_type e.epos) tmp;
		(* newline ctx; *)
		gen_expr ctx e;
		(* newline ctx; *)
		ctx.writer.write "}}";
		handle_break();
	| TTry (e,catchs) ->
		ctx.writer.write "try ";
		gen_expr ctx e;
		List.iter (fun (v,e) ->
			(* newline ctx; *)
			ctx.writer.write_format "catch( %s : %s )" (s_ident v.v_name) (type_str ctx v.v_type e.epos);
			gen_expr ctx e;
		) catchs;
	| TMatch (e,_,cases,def) ->
		ctx.writer.write_format "{";
		let bend = open_block ctx in
		(* newline ctx; *)
		let tmp = gen_local ctx "$e" in
		ctx.writer.write_format "var %s : enum = " tmp;
		gen_value ctx e;
		(* newline ctx; *)
		ctx.writer.write_format "switch( %s.index ) {" tmp;
		List.iter (fun (cl,params,e) ->
			List.iter (fun c ->
				(* newline ctx; *)
				ctx.writer.write_format "case %d:" c;
			) cl;
			(match params with
			| None | Some [] -> ()
			| Some l ->
				let n = ref (-1) in
				let l = List.fold_left (fun acc v -> incr n; match v with None -> acc | Some v -> (v,!n) :: acc) [] l in
				match l with
				| [] -> ()
				| l ->
					(* newline ctx; *)
					ctx.writer.write "var ";
					concat ctx ", " (fun (v,n) ->
						ctx.writer.write_format "%s : %s = %s.params[%d]" (s_ident v.v_name) (type_str ctx v.v_type e.epos) tmp n;
					) l);
			gen_block ctx e;
			ctx.writer.write_format "break";
		) cases;
		(match def with
		| None -> ()
		| Some e ->
			(* newline ctx; *)
			ctx.writer.write "default:";
			gen_block ctx e;
			ctx.writer.write_format "break";
		);
		(* newline ctx; *)
		ctx.writer.write "}";
		bend();
		(* newline ctx; *)
		ctx.writer.write "}";
	| TSwitch (e,cases,def) ->
		ctx.writer.write "switch";
		gen_value ctx (parent e);
		ctx.writer.write " {";
		(* newline ctx; *)
		List.iter (fun (el,e2) ->
			List.iter (fun e ->
				ctx.writer.write "case ";
				gen_value ctx e;
				ctx.writer.write ":";
			) el;
			gen_block ctx e2;
			ctx.writer.write_format "break";
			(* newline ctx; *)
		) cases;
		(match def with
		| None -> ()
		| Some e ->
			ctx.writer.write "default:";
			gen_block ctx e;
			ctx.writer.write_format "break";
			(* newline ctx; *)
		);
		ctx.writer.write "}"
	| TCast (e1,None) ->
		ctx.writer.write "((";
		gen_expr ctx e1;
		ctx.writer.write_format ") as %s)" (type_str ctx e.etype e.epos);
	| TCast (e1,Some t) ->
		gen_expr ctx (Codegen.default_cast ctx.inf.com e1 t e.etype e.epos)

and gen_block ctx e =
	(* newline ctx; *)
	match e.eexpr with
	| TBlock [] -> ()
	| _ ->
		gen_expr ctx e;
		newline ctx

and gen_value ctx e =
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
		let t = type_str ctx e.etype e.epos in
		let r = alloc_var (gen_local ctx "$r") e.etype in
		ctx.in_value <- Some r;
		if ctx.in_static then
			ctx.writer.write_format "function() : %s " t
		else
			ctx.writer.write_format "(function($this:%s) : %s " (snd ctx.path) t;
		let b = if block then begin
			ctx.writer.write "{";
			let b = open_block ctx in
			(* newline ctx; *)
			ctx.writer.write_format "var %s : %s" r.v_name t;
			(* newline ctx; *)
			b
		end else
			(fun() -> ())
		in
		(fun() ->
			if block then begin
				(* newline ctx; *)
				ctx.writer.write_format "return %s" r.v_name;
				b();
				(* newline ctx; *)
				ctx.writer.write "}";
			end;
			ctx.in_value <- old;
			if ctx.in_static then
				ctx.writer.write_format "()"
			else
				ctx.writer.write_format "(%s))" (this ctx)
		)
	in
	match e.eexpr with
	| TCall ({ eexpr = TLocal { v_name = "__keys__" } },_) | TCall ({ eexpr = TLocal { v_name = "__hkeys__" } },_) ->
		let v = value true in
		gen_expr ctx e;
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
		gen_expr ctx e
	| TCast (e1,t) ->
		gen_value ctx (match t with None -> e1 | Some t -> Codegen.default_cast ctx.inf.com e1 t e.etype e.epos)
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
		gen_expr ctx e;
		v()
	| TBlock [] ->
		ctx.writer.write "null"
	| TBlock [e] ->
		gen_value ctx e
	| TBlock el ->
		let v = value true in
		let rec loop = function
			| [] ->
				ctx.writer.write "return null";
			| [e] ->
				gen_expr ctx (assign e);
			| e :: l ->
				gen_expr ctx e;
				(* newline ctx; *)
				loop l
		in
		loop el;
		v();
	| TIf (cond,e,eo) ->
		ctx.writer.write "(";
		gen_value ctx cond;
		ctx.writer.write "?";
		gen_value ctx e;
		ctx.writer.write ":";
		(match eo with
		| None -> ctx.writer.write "null"
		| Some e -> gen_value ctx e);
		ctx.writer.write ")"
	| TSwitch (cond,cases,def) ->
		let v = value true in
		gen_expr ctx (mk (TSwitch (cond,
			List.map (fun (e1,e2) -> (e1,assign e2)) cases,
			match def with None -> None | Some e -> Some (assign e)
		)) e.etype e.epos);
		v()
	| TMatch (cond,enum,cases,def) ->
		let v = value true in
		gen_expr ctx (mk (TMatch (cond,enum,
			List.map (fun (constr,params,e) -> (constr,params,assign e)) cases,
			match def with None -> None | Some e -> Some (assign e)
		)) e.etype e.epos);
		v()
	| TTry (b,catchs) ->
		let v = value true in
		gen_expr ctx (mk (TTry (block (assign b),
			List.map (fun (v,e) -> v, block (assign e)) catchs
		)) e.etype e.epos);
		v()

let final m =
	if has_meta ":final" m then "final " else ""

let generate_field ctx static f =
	(* newline ctx; *)
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
			ctx.writer.write_format "[%s" n;
			(match args with
			| [] -> ()
			| _ ->
				ctx.writer.write_format "(";
				concat ctx "," (fun a ->
					match mk_arg a with
					| None, s -> gen_constant ctx (snd a) (TString s)
					| Some s, e -> ctx.writer.write_format "%s=" s; gen_constant ctx (snd a) (TString e)
				) args;
				ctx.writer.write_format ")");
			ctx.writer.write_format "]";
		| _ -> ()
	) f.cf_meta;
	(* let public = f.cf_public || Hashtbl.mem ctx.get_sets (f.cf_name,static) || (f.cf_name = "main" && static) || f.cf_name = "resolve" || has_meta ":public" f.cf_meta in *)
	let rights = (if static then "+ " else "- ") in
	let p = ctx.curclass.cl_pos in
	match f.cf_expr, f.cf_kind with
	| Some { eexpr = TFunction fd }, Method (MethNormal | MethInline) ->
		ctx.writer.write_format "%s%s " rights (if static then "" else final f.cf_meta);
		let rec loop c =
			match c.cl_super with
			| None -> ()
			| Some (c,_) ->
				if PMap.mem f.cf_name c.cl_fields then
					ctx.writer.write "override "
				else
					loop c
		in
		if not static then loop ctx.curclass;
		let h = gen_function_header ctx (Some (s_ident f.cf_name, f.cf_meta)) fd f.cf_params p in
		gen_expr ctx fd.tf_expr;
		h();
		newline ctx
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
				ctx.writer.write_format "function %s(" (loop f.cf_meta);
				concat ctx "," (fun (arg,o,t) ->
					let tstr = type_str ctx t p in
					ctx.writer.write_format "%s : %s" arg tstr;
					if o then ctx.writer.write_format " = %s" (default_value tstr);
				) args;
				ctx.writer.write_format ") : %s " (type_str ctx r p);
			| _ when is_getset ->
				let t = type_str ctx f.cf_type p in
				let id = s_ident f.cf_name in
				(match f.cf_kind with
				| Var v ->
					(match v.v_read with
					| AccNormal -> ctx.writer.write_format "function get %s() : %s;" id t;
					| AccCall s -> ctx.writer.write_format "function %s() : %s;" s t;
					| _ -> ());
					(match v.v_write with
					| AccNormal -> ctx.writer.write_format "function set %s( __v : %s ) : void;" id t;
					| AccCall s -> ctx.writer.write_format "function %s( __v : %s ) : %s;" s t t;
					| _ -> ());
				| _ -> assert false)
			| _ -> ()
		else
		let gen_init () = match f.cf_expr with
			| None -> ()
			| Some e ->
				ctx.writer.write_format " = ";
				gen_value ctx e
		in
		if is_getset then begin
			let t = type_str ctx f.cf_type p in
			let id = s_ident f.cf_name in
			let v = (match f.cf_kind with Var v -> v | _ -> assert false) in
			(match v.v_read with
			| AccNormal ->
				ctx.writer.write_format "%s function get %s() : %s { return $%s; }" rights id t id;
				newline ctx
			| AccCall m ->
				ctx.writer.write_format "%s function get %s() : %s { return %s(); }" rights id t m;
				newline ctx
			| AccNo | AccNever ->
				ctx.writer.write_format "%s function get %s() : %s { return $%s; }" (if v.v_read = AccNo then "protected" else "private") id t id;
				newline ctx
			| _ ->
				());
			(match v.v_write with
			| AccNormal ->
				ctx.writer.write_format "%s function set %s( __v : %s ) : void { $%s = __v; }" rights id t id;
				newline ctx
			| AccCall m ->
				ctx.writer.write_format "%s function set %s( __v : %s ) : void { %s(__v); }" rights id t m;
				newline ctx
			| AccNo | AccNever ->
				ctx.writer.write_format "%s function set %s( __v : %s ) : void { $%s = __v; }" (if v.v_write = AccNo then "protected" else "private") id t id;
				newline ctx
			| _ -> ());
			ctx.writer.write_format "%sprotected var $%s : %s" (if static then "static " else "") (s_ident f.cf_name) (type_str ctx f.cf_type p);
			gen_init()
		end else begin
			ctx.writer.write_format "%s var %s : %s" rights (s_ident f.cf_name) (type_str ctx f.cf_type p);
			gen_init()
		end

let rec define_getset ctx stat c =
	let def f name =
		Hashtbl.add ctx.get_sets (name,stat) f.cf_name
	in
	let field f =
		match f.cf_kind with
		| Method _ -> ()
		| Var v ->
			(match v.v_read with AccCall m -> def f m | _ -> ());
			(match v.v_write with AccCall m -> def f m | _ -> ())
	in
	List.iter field (if stat then c.cl_ordered_statics else c.cl_ordered_fields);
	match c.cl_super with
	| Some (c,_) when not stat -> define_getset ctx stat c
	| _ -> ()





(* Generate a class, header + implementation *)
let generate_class common_ctx class_def file_info =
	
	(* let dir = infos.com.file :: fst path in create_dir [] dir; *)
	
	(* Create the implementation file *)
	
	let class_path = class_def.cl_path in
	let class_name = (snd class_def.cl_path) in
	let m_file = new_placed_m_file common_ctx class_path in
	let output_m = (m_file#write) in
	let ctx = new_context common_ctx output_m file_info
	
	ctx.curclass <- class_def;
	define_getset common_ctx true class_def;
	define_getset common_ctx false class_def;
	common_ctx.local_types <- List.map snd c.cl_types;
	
	output_m "#include <hxcpp.h>\n\n";
	
	let pack = open_block ctx in
	output_m ("#import \""^(snd c.cl_path)^".h\"\n\n@implementation "^(snd c.cl_path)^"\n")
	(* (snd c.cl_path) returns the class name *)
	(* output_h "#import <UIKit/UIKit.h>\n\n";
	output_h ("@interface "^(snd c.cl_path)^"\n");
	(* ctx.writer.write_format "\npublic %s%s%s %s " (final c.cl_meta) (match c.cl_dynamic with None -> "" | Some _ -> if c.cl_interface then "" else "dynamic ") (if c.cl_interface then "interface" else "class") (snd c.cl_path); *)
	
	(match c.cl_super with
		| None -> ()
		| Some (csup,_) -> ctx.writer.write_format ": %s " (s_path ctx true csup.cl_path c.cl_pos));
	
	(match c.cl_implements with
		| [] -> ()
		| l ->
			spr_h ctx (if c.cl_interface then "extends " else "<implement something here> ");
			concat ctx ", " (fun (i,_) -> ctx.writer.write_format "%s" (s_path ctx true i.cl_path c.cl_pos)) l);
	
	let cl = open_block ctx in
	(match c.cl_constructor with
	| None -> ()
	| Some f ->
		let f = { f with
			cf_name = snd c.cl_path;
			cf_public = true;
			cf_kind = Method MethNormal;
		} in
		ctx.constructor_block <- true;
		generate_field ctx false f;
	);
	
	List.iter (generate_field ctx true) c.cl_ordered_statics;
	List.iter (generate_field ctx false) c.cl_ordered_fields;
	
	cl();
	pack();
	(* newline ctx; *)
	ctx.writer.write_format "@end";
	ctx.writer.write_format "@end";
	newline ctx *)


	
let generate_main ctx =
	let base_dir = ctx.file in
	let main_file = new_m_file base_dir ([],"main") in
	let output_main = (main_file#write) in
	output_main "#import <UIKit/UIKit.h>
#import \"AppDelegate.h\"

int main(int argc, char *argv[]) {
	@autoreleasepool {
		return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}";
	main_file#close;;
	(* pack();
	newline ctx *)
	
let generate_pch ctx inits =
	ctx.curclass <- { null_class with cl_path = [],"App-Prefix" };
	let pack = open_block ctx in
	ctx.writer.write "//
// Prefix header for all source files of the 'ReferenceApplication' target in the 'ReferenceApplication' project
//

#import <Availability.h>

#ifndef __IPHONE_3_0
#warning \"This project uses features only available in iOS SDK 3.0 and later.\"
#endif

#ifdef __OBJC__
	#import <UIKit/UIKit.h>
	#import <Foundation/Foundation.h>
#endif";
	pack();
	newline ctx

let generate_enum ctx e =
	();


(* The main entry of the generator *)
let generate common_ctx =
	
	(* generate_resources infos; *)
	
	(* let ctx = init infos ([],"enum") in
	generate_base_enum ctx;
	close ctx; *)
	
	make_base_directory common_ctx.file;

	let debug = false in
	let exe_classes = ref [] in
	let boot_classes = ref [] in
	let init_classes = ref [] in
	let file_info = ref PMap.empty in
	let class_text path = join_class_path path "/";
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
				(* let ctx = (* init infos class_def.cl_path in  *) *)
				generate_class common_ctx class_def file_info;
				
		| TEnumDecl e ->
			let pack,name = e.e_path in
			let e = { e with e_path = (pack,protect name) } in
			if e.e_extern then
				()
			else
				let ctx = generate_enum common_ctx e;
				(* close ctx *)
		| TTypeDecl _ | TAbstractDecl _ ->
			()
	) common_ctx.types;
	
	(match common_ctx.main with
	| None -> ()
	| Some e -> inits := e :: !inits);
	
	generate_main common_ctx;
