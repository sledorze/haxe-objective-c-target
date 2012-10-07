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

(*
  Code for generating source files.
  It manages creating diretories, indents, blocks and only modifying files
   when the content changes.
*)

(*
  A class_path is made from a package (array of strings) and a class name.
  Join these together, including a separator.  eg, "/" for includes : pack1/pack2/Name or "::"
	for namespace "pack1::pack2::Name"
*)
let join_class_path path separator =
	let result = match fst path, snd path with
	| [], s -> s
	| el, s -> String.concat separator el ^ separator ^ s in
	if (String.contains result '+') then begin
		let idx = String.index result '+' in
		(String.sub result 0 idx) ^ (String.sub result (idx+1) ((String.length result) - idx -1 ) )
	end else
		result;;

class source_writer write_func close_func=
	object(this)
	val indent_str = "\t"
	val mutable indent = ""
	val mutable indents = []
	val mutable just_finished_block = false
	method close = close_func(); ()
	method write x = write_func x; just_finished_block <- false
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


	method add_include class_path =
		(* this#write ("#ifndef INCLUDED_" ^ (join_class_path class_path "_") ^ "\n"); *)
		this#write ("#import <" ^ (join_class_path class_path "/") ^ ".h>\n");
		(* this#write ("#endif\n") *)
end;;

let file_source_writer filename =
	let out_file = open_out filename in
	new source_writer (output_string out_file) (fun ()-> close_out out_file);;


let read_whole_file chan =
	Std.input_all chan;;

(* The cached_source_writer will not write to the file if it has not changed,
	thus allowing the makefile dependencies to work correctly *)
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


let new_source_file base_dir sub_dir extension class_path =
	make_class_directories base_dir ( sub_dir :: (fst class_path));
	cached_source_writer
		( base_dir ^ "/" ^ sub_dir ^ "/" ^ ( String.concat "/" (fst class_path) ) ^ "/" ^
		(snd class_path) ^ extension);;


let new_objc_file base_dir = new_source_file base_dir "" ".m";;
let new_header_file base_dir = new_source_file base_dir "" ".h";;
let make_base_directory file = make_class_directories "" ( ( Str.split_delim (Str.regexp "[\\/]+") file ) );




(* Objective-C code generation context *)

type context_infos = {
	com : Common.context;
}

type context = {
	inf : context_infos;
	ch : out_channel;
	buf : Buffer.t;
	path : path;
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
}

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
	| (["objc"],"FlashXml__") ->
		"Xml"
	| (["flash";"errors"],"Error") ->
		"Error"
	| (["flash"],"Vector") ->
		"Vector"
	| (["objc";"ios"],"XML") ->
		"XML"
	| (["haxe"],"Int32") when not stat ->
		"int"
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
	(* AS3 keywords which are not haXe ones *)
	"each";"label";"finally";"with";"final";"internal";"native";"const";"namespace";"include";"delete";
	(* some globals give some errors with Flex SDK as well *)
	"print";
	(* we don't include get+set since they are not 'real' keywords, but they can't be used as method names *)
	];
	h

let s_ident n =
	if Hashtbl.mem reserved n then "_" ^ n else n

let init infos path =
	let rec create acc = function
		| [] -> ()
		| d :: l ->
			let dir = String.concat "/" (List.rev (d :: acc)) in
			if not (Sys.file_exists dir) then Unix.mkdir dir 0o755;
			create (d :: acc) l
	in
	let dir = infos.com.file :: fst path in
	create [] dir;
	let ch = open_out (String.concat "/" dir ^ "/" ^ snd path ^ ".m") in
	let imports = Hashtbl.create 0 in
	Hashtbl.add imports (snd path) [fst path];
	{
		inf = infos;
		tabs = "";
		ch = ch;
		path = path;
		buf = Buffer.create (1 lsl 14);
		in_value = None;
		in_static = false;
		handle_break = false;
		imports = imports;
		curclass = null_class;
		gen_uid = 0;
		local_types = [];
		get_sets = Hashtbl.create 0;
		constructor_block = false;
	}

let close ctx =
	output_string ctx.ch (Printf.sprintf "// File generated with the new haXe objc target.\n//\n");
	Hashtbl.iter (fun name paths ->
		List.iter (fun pack ->
			let path = pack, name in
			if path <> ctx.path then output_string ctx.ch ("#import " ^ Ast.s_type_path path ^ "\n");
		) paths
	) ctx.imports;
	output_string ctx.ch (Buffer.contents ctx.buf);
	close_out ctx.ch

let save_locals ctx =
	(fun() -> ())

let gen_local ctx l =
	ctx.gen_uid <- ctx.gen_uid + 1;
	if ctx.gen_uid = 1 then l else l ^ string_of_int ctx.gen_uid

let spr ctx s = Buffer.add_string ctx.buf s
let print ctx = Printf.kprintf (fun s -> Buffer.add_string ctx.buf s)

let unsupported p = error "This expression cannot be generated to Objective-C" p

let newline ctx =
	let rec loop p =
		match Buffer.nth ctx.buf p with
		| '}' | '{' | ':' | ' ' -> print ctx "\n%s" ctx.tabs
		| '\n' | '\t' -> loop (p - 1)
		| _ -> print ctx ";\n%s" ctx.tabs
	in
	loop (Buffer.length ctx.buf - 1)

let rec concat ctx s f = function
	| [] -> ()
	| [x] -> f x
	| x :: l ->
		f x;
		spr ctx s;
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
	| TEnum (e,_) ->
		if e.e_extern then (match e.e_path with
			| [], "Void" -> "void"
			| [], "Bool" -> "BOOL"
			| _ ->
				let rec loop = function
					| [] -> "id"
					| (":fakeEnum",[Ast.EConst (Ast.Type n),_],_) :: _ ->
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
		"Vector.<" ^ type_str ctx pt p ^ ">"
	| TInst (c,_) ->
		(match c.cl_kind with
		| KNormal | KGeneric | KGenericInstance _ -> s_path ctx false c.cl_path p
		| KTypeParameter | KExtension _ | KExpr _ | KMacroType -> "*")
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
			spr ctx "try {";
			let b = open_block ctx in
			newline ctx;
			ctx.handle_break <- true;
			(fun() ->
				b();
				ctx.handle_break <- old_handle;
				newline ctx;
				spr ctx "} catch( e : * ) { if( e != \"__break__\" ) throw e; }";
			)

let this ctx = if ctx.in_value <> None then "$this" else "self"

let escape_bin s =
	let b = Buffer.create 0 in
	for i = 0 to String.length s - 1 do
		match Char.code (String.unsafe_get s i) with
		| c when c < 32 -> Buffer.add_string b (Printf.sprintf "\\x%.2X" c)
		| c -> Buffer.add_char b (Char.chr c)
	done;
	Buffer.contents b

let gen_constant ctx p = function
	| TInt i -> print ctx "[NSNumber numberWithInt:%ld]" i(* %ld = int32 *)
	(* | TFloat s -> print ctx "[NSNumber numberWithFloat:%f]" s *)
	| TFloat f -> spr ctx f
	| TString s -> print ctx "@\"%s\"" (escape_bin (Ast.s_escape s))
	| TBool b -> spr ctx (if b then "YES" else "NO")
	| TNull -> spr ctx "nil"
	| TThis -> spr ctx "self"
	(* | TThis -> spr ctx (this ctx) *)
	| TSuper -> spr ctx "super"

(* A function header in objc is a message *)
let gen_function_header ctx name f params p =
	let old = ctx.in_value in
	let locals = save_locals ctx in
	let old_t = ctx.local_types in
	ctx.in_value <- None;
	ctx.local_types <- List.map snd params @ ctx.local_types;
	print ctx "(%s)" (type_str ctx f.tf_type p);(* Print the return type of the function *)
	print ctx "%s" (match name with None -> "" | Some (n,meta) ->
		let rec loop = function
			| [] -> n
			| _ :: l -> loop l
		in
		" " ^ loop meta
	);
	concat ctx " " (fun (v,c) ->
		let tstr = type_str ctx v.v_type p in
		print ctx "%s:(%s%s)%s" (s_ident v.v_name) tstr "*" (s_ident v.v_name);
		match c with
		| None ->
			if ctx.constructor_block then print ctx " = %s" (default_value tstr);
		| Some c ->
			spr ctx " = ";
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
		spr ctx " ";
		gen_value ctx e;
		spr ctx "]";
		spr ctx "(";
		concat ctx "," (gen_value ctx) el;
		spr ctx ")";
	| TLocal { v_name = "__is__" } , [e1;e2] ->
		gen_value ctx e1;
		spr ctx " is ";
		gen_value ctx e2;
	| TLocal { v_name = "__as__" }, [e1;e2] ->
		gen_value ctx e1;
		spr ctx " as ";
		gen_value ctx e2;
	| TLocal { v_name = "__int__" }, [e] ->
		spr ctx "int(";
		gen_value ctx e;
		spr ctx ")";
	| TLocal { v_name = "__float__" }, [e] ->
		spr ctx "Number(";
		gen_value ctx e;
		spr ctx ")";
	| TLocal { v_name = "__typeof__" }, [e] ->
		spr ctx "typeof ";
		gen_value ctx e;
	| TLocal { v_name = "__keys__" }, [e] ->
		let ret = (match ctx.in_value with None -> assert false | Some r -> r) in
		print ctx "%s = [[NSMutableArray alloc] init]" ret.v_name;
		newline ctx;
		let b = save_locals ctx in
		let tmp = gen_local ctx "$k" in
		print ctx "for (NSString *%s in " tmp;
		gen_value ctx e;
		print ctx " %s addObject ( %s )" ret.v_name tmp;
		b();
	| TLocal { v_name = "__hkeys__" }, [e] ->
		let ret = (match ctx.in_value with None -> assert false | Some r -> r) in
		print ctx "%s = [[NSMutableArray alloc] init]" ret.v_name;
		newline ctx;
		let b = save_locals ctx in
		let tmp = gen_local ctx "$k" in
		print ctx "for (NSString *%s in " tmp;
		gen_value ctx e;
		print ctx ") %s addObject (%s.substr(1))" ret.v_name tmp;
		b();
	| TLocal { v_name = "__foreach__" }, [e] ->
		let ret = (match ctx.in_value with None -> assert false | Some r -> r) in
		print ctx "%s = [[NSMutableArray alloc] init]" ret.v_name;
		newline ctx;
		let b = save_locals ctx in
		let tmp = gen_local ctx "$k" in
		print ctx "for each (id %s in " tmp;
		gen_value ctx e;
		print ctx ") %s.push(%s)" ret.v_name tmp;
		b();
	| TLocal { v_name = "__new__" }, e :: args ->
		spr ctx "[";
		gen_value ctx e;
		spr ctx " alloc]";
		concat ctx "," (gen_value ctx) args;
		spr ctx ")";
	| TLocal { v_name = "__delete__" }, [e;f] ->
		spr ctx "delete(";
		gen_value ctx e;
		spr ctx "[";
		gen_value ctx f;
		spr ctx "]";
		spr ctx ")";
	| TLocal { v_name = "__unprotect__" }, [e] ->
		gen_value ctx e
	| TLocal { v_name = "__vector__" }, [e] ->
		spr ctx (type_str ctx r e.epos);
		spr ctx "(";
		gen_value ctx e;
		spr ctx ")"
	| TField ({ eexpr = TTypeExpr (TClassDecl { cl_path = (["flash"],"Lib") }) },f), args ->
		(match f, args with
		| "as", [e1;e2] ->
			gen_value ctx e1;
			spr ctx " as ";
			gen_value ctx e2
		| _ ->
			gen_value ctx e;
			spr ctx "(";
			concat ctx "," (gen_value ctx) el;
			spr ctx ")")
	| TField ({ eexpr = TTypeExpr (TClassDecl { cl_path = (["flash"],"Vector") }) },f), args ->
		(match f, args with
		| "ofArray", [e] | "convert", [e] ->
			(match follow r with
			| TInst ({ cl_path = (["flash"],"Vector") },[t]) ->
				print ctx "Vector.<%s>(" (type_str ctx t e.epos);
				gen_value ctx e;
				print ctx ")";
			| _ -> assert false)
		| _ -> assert false)
	| _ ->
		gen_value ctx e;
		spr ctx " :";
		concat ctx ", " (gen_value ctx) el;
		spr ctx "]"

and gen_value_op ctx e =
	match e.eexpr with
	| TBinop (op,_,_) when op = Ast.OpAnd || op = Ast.OpOr || op = Ast.OpXor ->
		spr ctx "(";
		gen_value ctx e;
		spr ctx ")";
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
		| [], "String", "charCodeAt"
		->
			print ctx "[\"%s\"]" s
		| [], "Date", "toString" ->
			print ctx "[\"toStringHX\"]"
		| [], "String", "cca" ->
			print ctx ".charCodeAt"
		| ["flash";"xml"], "XML", "namespace" ->
			print ctx ".namespace"
		| _ ->
			print ctx ".%s" (s_ident s)
	in
	match follow t with
	| TInst (c,_) -> field c
	| TAnon a ->
		(match !(a.a_status) with
		| Statics c -> field c
		| _ -> print ctx ".%s" (s_ident s))
	| _ ->
		print ctx ".%s" (s_ident s)

and gen_expr ctx e =
	match e.eexpr with
	| TConst c ->
		gen_constant ctx e.epos c
	| TLocal v ->
		spr ctx (s_ident v.v_name)
	| TEnumField (en,s) ->
		print ctx "%s.%s" (s_path ctx true en.e_path e.epos) (s_ident s)
	| TArray ({ eexpr = TLocal { v_name = "__global__" } },{ eexpr = TConst (TString s) }) ->
		let path = Ast.parse_path s in
		spr ctx (s_path ctx false path e.epos)
	| TArray (e1,e2) ->
		gen_value ctx e1;
		spr ctx "[NSMutableArray arrayWithObjects:";
		gen_value ctx e2;
		spr ctx "]";
	| TBinop (op,{ eexpr = TField (e1,s) },e2) ->
		gen_value_op ctx e1;
		gen_field_access ctx e1.etype s;
		print ctx " %s " (Ast.s_binop op);
		gen_value_op ctx e2;
	| TBinop (op,e1,e2) ->
		gen_value_op ctx e1;
		print ctx " %s " (Ast.s_binop op);
		gen_value_op ctx e2;
	| TField (e,s) | TClosure (e,s) ->
   		gen_value ctx e;
		gen_field_access ctx e.etype s
	| TTypeExpr t ->
		spr ctx (s_path ctx true (t_path t) e.epos)
	| TParenthesis e ->
		spr ctx "(";
		gen_value ctx e;
		spr ctx ")";
	| TReturn eo ->
		if ctx.in_value <> None then unsupported e.epos;
		(match eo with
		| None ->
			spr ctx "return"
		| Some e when (match follow e.etype with TEnum({ e_path = [],"Void" },[]) -> true | _ -> false) ->
			gen_value ctx e;
			newline ctx;
			spr ctx "return"
		| Some e ->
			spr ctx "return ";
			gen_value ctx e);
	| TBreak ->
		if ctx.in_value <> None then unsupported e.epos;
		if ctx.handle_break then spr ctx "throw \"__break__\"" else spr ctx "break"
	| TContinue ->
		if ctx.in_value <> None then unsupported e.epos;
		spr ctx "continue"
	| TBlock el ->
		let b = save_locals ctx in
		print ctx "{";
		let bend = open_block ctx in
		let cb = (if not ctx.constructor_block then
			(fun () -> ())
		else if not (Codegen.constructor_side_effects e) then begin
			ctx.constructor_block <- false;
			(fun () -> ())
		end else begin
			ctx.constructor_block <- false;
			print ctx " if( !%s.skip_constructor ) {" (s_path ctx true (["flash"],"Boot") e.epos);
            (fun() -> print ctx "}")
		end) in
		List.iter (fun e -> newline ctx; gen_expr ctx e) el;
		bend();
		newline ctx;
		cb();
		print ctx "}";
		b();
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
		spr ctx "[NSArray arrayWithObjects:";
		concat ctx "," (gen_value ctx) el;
		spr ctx ", nil]"
	| TThrow e ->
		spr ctx "throw ";
		gen_value ctx e;
	| TVars [] ->
		()
	| TVars vl ->
		(* spr ctx "var "; *)
		concat ctx "\n" (fun (v,eo) ->
			print ctx "%s *%s" (type_str ctx v.v_type e.epos) (s_ident v.v_name);
			match eo with
			| None -> ()
			| Some e ->
				spr ctx " = ";
				gen_value ctx e;
		) vl;
	| TNew (c,params,el) ->
		(match c.cl_path, params with
		| (["flash"],"Vector"), [pt] -> print ctx "new Vector.<%s>(" (type_str ctx pt e.epos)
		| _ -> print ctx "[[%s alloc] init]" (s_path ctx true c.cl_path e.epos));
		concat ctx "," (gen_value ctx) el;
		spr ctx ")"
	| TIf (cond,e,eelse) ->
		spr ctx "if";
		gen_value ctx (parent cond);
		spr ctx " ";
		gen_expr ctx e;
		(match eelse with
		| None -> ()
		| Some e ->
			newline ctx;
			spr ctx "else ";
			gen_expr ctx e);
	| TUnop (op,Ast.Prefix,e) ->
		spr ctx (Ast.s_unop op);
		gen_value ctx e
	| TUnop (op,Ast.Postfix,e) ->
		gen_value ctx e;
		spr ctx (Ast.s_unop op)
	| TWhile (cond,e,Ast.NormalWhile) ->
		let handle_break = handle_break ctx e in
		spr ctx "while";
		gen_value ctx (parent cond);
		spr ctx " ";
		gen_expr ctx e;
		handle_break();
	| TWhile (cond,e,Ast.DoWhile) ->
		let handle_break = handle_break ctx e in
		spr ctx "do ";
		gen_expr ctx e;
		spr ctx " while";
		gen_value ctx (parent cond);
		handle_break();
	| TObjectDecl fields ->
		spr ctx "{ ";
		concat ctx ", " (fun (f,e) -> print ctx "%s : " (s_ident f); gen_value ctx e) fields;
		spr ctx "}"
	| TFor (v,it,e) ->
		let handle_break = handle_break ctx e in
		let b = save_locals ctx in
		let tmp = gen_local ctx "$it" in
		print ctx "{ var %s : * = " tmp;
		gen_value ctx it;
		newline ctx;
		print ctx "while( %s.hasNext() ) { var %s : %s = %s.next()" tmp (s_ident v.v_name) (type_str ctx v.v_type e.epos) tmp;
		newline ctx;
		gen_expr ctx e;
		newline ctx;
		spr ctx "}}";
		b();
		handle_break();
	| TTry (e,catchs) ->
		spr ctx "try ";
		gen_expr ctx e;
		List.iter (fun (v,e) ->
			newline ctx;
			print ctx "catch( %s : %s )" (s_ident v.v_name) (type_str ctx v.v_type e.epos);
			gen_expr ctx e;
		) catchs;
	| TMatch (e,_,cases,def) ->
		print ctx "{";
		let bend = open_block ctx in
		newline ctx;
		let b = save_locals ctx in
		let tmp = gen_local ctx "$e" in
		print ctx "var %s : enum = " tmp;
		gen_value ctx e;
		newline ctx;
		print ctx "switch( %s.index ) {" tmp;
		List.iter (fun (cl,params,e) ->
			List.iter (fun c ->
				newline ctx;
				print ctx "case %d:" c;
			) cl;
			let b = save_locals ctx in
			(match params with
			| None | Some [] -> ()
			| Some l ->
				let n = ref (-1) in
				let l = List.fold_left (fun acc v -> incr n; match v with None -> acc | Some v -> (v,!n) :: acc) [] l in
				match l with
				| [] -> ()
				| l ->
					newline ctx;
					spr ctx "var ";
					concat ctx ", " (fun (v,n) ->
						print ctx "%s : %s = %s.params[%d]" (s_ident v.v_name) (type_str ctx v.v_type e.epos) tmp n;
					) l);
			gen_block ctx e;
			print ctx "break";
			b()
		) cases;
		(match def with
		| None -> ()
		| Some e ->
			newline ctx;
			spr ctx "default:";
			gen_block ctx e;
			print ctx "break";
		);
		newline ctx;
		spr ctx "}";
		bend();
		newline ctx;
		spr ctx "}";
		b()
	| TSwitch (e,cases,def) ->
		spr ctx "switch";
		gen_value ctx (parent e);
		spr ctx " {";
		newline ctx;
		List.iter (fun (el,e2) ->
			List.iter (fun e ->
				spr ctx "case ";
				gen_value ctx e;
				spr ctx ":";
			) el;
			gen_block ctx e2;
			print ctx "break";
			newline ctx;
		) cases;
		(match def with
		| None -> ()
		| Some e ->
			spr ctx "default:";
			gen_block ctx e;
			print ctx "break";
			newline ctx;
		);
		spr ctx "}"
	| TCast (e1,None) ->
		spr ctx "(";
		gen_expr ctx e1;
		print ctx "*) %s" (type_str ctx e.etype e.epos);
	| TCast (e1,Some t) ->
		gen_expr ctx (Codegen.default_cast ctx.inf.com e1 t e.etype e.epos)

and gen_block ctx e =
	newline ctx;
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
		let locs = save_locals ctx in
		let r = alloc_var (gen_local ctx "$r") e.etype in
		ctx.in_value <- Some r;
		if ctx.in_static then
			print ctx "function() : %s " t
		else
			print ctx "(function($this:%s) : %s " (snd ctx.path) t;
		let b = if block then begin
			spr ctx "{";
			let b = open_block ctx in
			newline ctx;
			print ctx "var %s : %s" r.v_name t;
			newline ctx;
			b
		end else
			(fun() -> ())
		in
		(fun() ->
			if block then begin
				newline ctx;
				print ctx "return %s" r.v_name;
				b();
				newline ctx;
				spr ctx "}";
			end;
			ctx.in_value <- old;
			locs();
			if ctx.in_static then
				print ctx "()"
			else
				print ctx "(%s))" (this ctx)
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
		spr ctx "nil"
	| TBlock [e] ->
		gen_value ctx e
	| TBlock el ->
		let v = value true in
		let rec loop = function
			| [] ->
				spr ctx "return nil";
			| [e] ->
				gen_expr ctx (assign e);
			| e :: l ->
				gen_expr ctx e;
				newline ctx;
				loop l
		in
		loop el;
		v();
	| TIf (cond,e,eo) ->
		spr ctx "(";
		gen_value ctx cond;
		spr ctx "?";
		gen_value ctx e;
		spr ctx ":";
		(match eo with
		| None -> spr ctx "nil"
		| Some e -> gen_value ctx e);
		spr ctx ")"
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

let generate_field ctx static f =
	newline ctx;
	ctx.in_static <- static;
	ctx.gen_uid <- 0;
	List.iter (fun(m,pl,_) ->
		match m,pl with
		| ":meta", [Ast.ECall ((Ast.EConst (Ast.Ident n | Ast.Type n),_),args),_] ->
			let mk_arg (a,p) =
				match a with
				| Ast.EConst (Ast.String s) -> (None, s)
				| Ast.EBinop (Ast.OpAssign,(Ast.EConst (Ast.Ident n | Ast.Type n),_),(Ast.EConst (Ast.String s),_)) -> (Some n, s)
				| _ -> error "Invalid meta definition" p
			in
			print ctx "[%s" n;
			(match args with
			| [] -> ()
			| _ ->
				print ctx "(";
				concat ctx " " (fun a ->
					match mk_arg a with
					| None, s -> gen_constant ctx (snd a) (TString s)
					| Some s, e -> print ctx "%s=" s; gen_constant ctx (snd a) (TString e)
				) args;
				print ctx "]");
			print ctx "]";
		| _ -> ()
	) f.cf_meta;
	(* let public = f.cf_public || Hashtbl.mem ctx.get_sets (f.cf_name,static) || (f.cf_name = "main" && static) || f.cf_name = "resolve" in *)
	let rights = (if static then "+" else "-") in
	let p = ctx.curclass.cl_pos in
	match f.cf_expr, f.cf_kind with
	| Some { eexpr = TFunction fd }, Method (MethNormal | MethInline) ->
		print ctx "%s " rights;
		let rec loop c =
			match c.cl_super with
			| None -> ()
			| Some (c,_) ->
				if PMap.mem f.cf_name c.cl_fields then
					spr ctx "override "
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
				print ctx "- (%s) %s" (type_str ctx r p) f.cf_name;
				concat ctx "," (fun (arg,o,t) ->
					let tstr = type_str ctx t p in
					print ctx ":(%s)%s " tstr arg;
					(* if o then print ctx " = %s" (default_value tstr); *)
				) args;
				(* print ctx ") : %s " (type_str ctx r p); *)
			| _ when is_getset ->
				let t = type_str ctx f.cf_type p in
				let id = s_ident f.cf_name in
				(match f.cf_kind with
				| Var v ->
					(match v.v_read with
					| AccNormal | AccCall _ -> print ctx "- (%s) %s" t id;
					| _ -> ());
					(match v.v_write with
					| AccNormal | AccCall _ -> print ctx "- (void) set%s:(%s)__v " id t;
					| _ -> ());
				| _ -> assert false)
			| _ -> ()
		else
		if is_getset then begin
(* Generate getters and setters *)
			
			let t = type_str ctx f.cf_type p in
			let id = s_ident f.cf_name in
			let v = (match f.cf_kind with Var v -> v | _ -> assert false) in
(* Generate synthesizer *)
			(newline ctx;
			print ctx "@synthesize %s = _%s" id id;
			newline ctx);
(* Generate methods *)
(* When the getter or setter is a well defined method, ignore it: AccCall *)
			(match v.v_read with
			| AccNormal | AccNo | AccNever ->
				print ctx "- (%s) %s { return _%s; }" t id id;
				newline ctx
			| _ ->
				());
			(match v.v_write with
			| AccNormal | AccNo | AccNever ->
				print ctx "- (void) set%s:(%s*)__v { _%s = __v; }" id t id;
				newline ctx
			| _ -> ());
		end else begin
(* Generate class variables? *)
			print ctx "%s *%s " (type_str ctx f.cf_type p) (s_ident f.cf_name);
			match f.cf_expr with
			| None -> ()
			| Some e ->
				print ctx " = ";
				gen_value ctx e
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



let new_placed_cpp_file common_ctx class_path =
	let base_dir = common_ctx.file in
	if (Common.defined common_ctx "vcproj" ) then begin
		make_class_directories base_dir ("src"::[]);
		cached_source_writer
			( base_dir ^ "/src/" ^ ( String.concat "-" (fst class_path) ) ^ "-" ^
			(snd class_path) ^ ".mm")
	end else
		new_objc_file common_ctx.file class_path;;


(* Generate a header and an implementation file *)
let generate_class_files common_ctx class_def =
	let class_path = class_def.cl_path in
	let cpp_file = new_placed_cpp_file common_ctx class_path in
	let ctx = new_context common_ctx cpp_file debug in
	ctx.ctx_class_name <- "/" ^ (join_class_path class_path "/");
	
	
	
let generate_header ctx c =
	ctx.curclass <- c;
	define_getset ctx true c;
	define_getset ctx false c;
	ctx.local_types <- List.map snd c.cl_types;
	let pack = open_block ctx in
	print ctx "@interface %s : %s <%s> " (match c.cl_dynamic with None -> "" | Some _ -> if c.cl_interface then "" else "dynamic ") (if c.cl_interface then "interface" else "class") (snd c.cl_path);
	(match c.cl_super with
	| None -> ()
	| Some (csup,_) -> print ctx ": %s " (s_path ctx true csup.cl_path c.cl_pos));
	(match c.cl_implements with
	| [] -> ()
	| l ->
		spr ctx (if c.cl_interface then ": " else "< ");
		concat ctx ", " (fun (i,_) -> print ctx "%s" (s_path ctx true i.cl_path c.cl_pos)) l);
	spr ctx (if c.cl_interface then "" else ">");
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
	List.iter (generate_field ctx false) c.cl_ordered_fields;
	List.iter (generate_field ctx true) c.cl_ordered_statics;
	cl();
	newline ctx;
	print ctx "}";
	pack();
	newline ctx;
	print ctx "@end";
	newline ctx

let generate_implementation ctx c =
	ctx.curclass <- c;
	define_getset ctx true c;
	define_getset ctx false c;
	ctx.local_types <- List.map snd c.cl_types;
	let pack = open_block ctx in
	print ctx "\n@implementation %s" (snd c.cl_path);
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
	List.iter (generate_field ctx false) c.cl_ordered_fields;
	List.iter (generate_field ctx true) c.cl_ordered_statics;
	cl();
	newline ctx;
	pack();
	(* newline ctx; *)
	print ctx "@end\n";
	newline ctx


let generate_main ctx inits =
	ctx.curclass <- { null_class with cl_path = [],"main" };
	let pack = open_block ctx in
	spr ctx "#import <UIKit/UIKit.h>
#import \"AppDelegate.h\"

int main(int argc, char *argv[]) {
	@autoreleasepool {
		return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}";
	pack();
	newline ctx
	
let generate_pch ctx inits =
	ctx.curclass <- { null_class with cl_path = [],"App-Prefix" };
	let pack = open_block ctx in
	spr ctx "//
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


(* let generate_base_enum ctx =
	let pack = open_block ctx in
	spr ctx "\tpublic class enum {";
	let cl = open_block ctx in
	newline ctx;
	spr ctx "public var tag : String";
	newline ctx;
	spr ctx "public var index : int";
	newline ctx;
	spr ctx "public var params : Array";
	cl();
	newline ctx;
	print ctx "}";
	pack();
	newline ctx;
	print ctx "}";
	newline ctx *)
	
(* The common_ctx contains the haxe AST in the "types" field and the resources *)
let generate com =
	let infos = {
		com = com;
	} in
	let ctx = init infos ([],"enum") in
	(* generate_base_enum ctx; *)
	close ctx;
	let inits = ref [] in
	List.iter (fun t ->
		match t with
		| TClassDecl c ->
			let c = (match c.cl_path with
				| ["flash"],"FlashXml__" -> { c with cl_path = [],"Xml" }
				| (pack,name) -> { c with cl_path = (pack,protect name) }
			) in
			(match c.cl_init with
			| None -> ()
			| Some e -> inits := e :: !inits);
			if c.cl_extern then
				()(*Do not do anything for extern classes*)
			else
				let ctx = init infos c.cl_path in
				generate_class_files ctx c;
				close ctx
				
		| TEnumDecl e ->
			let pack,name = e.e_path in
			let e = { e with e_path = (pack,protect name) } in
			if e.e_extern && e.e_path <> ([],"Void") then
				()
			else
				()
				(* let ctx = init infos e.e_path in
				generate_enum ctx e;
				close ctx *)
		| TTypeDecl t ->
			()
	) com.types;
	(match com.main with
	| None -> ()
	| Some e -> inits := e :: !inits);
	let ctx = init infos ([],"main") in
	generate_main ctx (List.rev !inits);
	close ctx


(* The common_ctx contains the haxe AST in the "types" field and the resources 
let generate common_ctx =
	make_base_directory common_ctx.file;

	let debug = false in
	let exe_classes = ref [] in
	let boot_classes = ref [] in
	let init_classes = ref [] in
	let class_text path = join_class_path path "::" in
	let member_types = create_member_types common_ctx in
	let super_deps = create_super_dependencies common_ctx in
	let constructor_deps = create_constructor_dependencies common_ctx in
	let main_deps = ref [] in
	let build_xml = ref "" in

	List.iter (fun object_def ->
		(match object_def with
		| TClassDecl class_def when class_def.cl_extern -> ()
		| TClassDecl class_def ->
			let name =  class_text class_def.cl_path in
			let is_internal = is_internal_class class_def.cl_path in
			if (is_internal || (is_macro class_def.cl_meta) ) then
				( if debug then print_endline (" internal class " ^ name ))
			else begin
				build_xml := !build_xml ^ (get_code class_def.cl_meta ":buildXml");
				boot_classes := class_def.cl_path ::  !boot_classes;
				if (has_init_field class_def) then
					init_classes := class_def.cl_path ::  !init_classes;
				let deps = generate_class_files common_ctx member_types super_deps constructor_deps class_def in
				exe_classes := (class_def.cl_path, deps)  ::  !exe_classes;
			end
		| TEnumDecl enum_def ->
			let name =  class_text enum_def.e_path in
			let is_internal = is_internal_class enum_def.e_path in
			if (is_internal) then
				(if debug then print_endline (" internal enum " ^ name ))
			else begin
				let meta = Codegen.build_metadata common_ctx object_def in
				if (enum_def.e_extern) then
					(if debug then print_endline ("external enum " ^ name ));
				boot_classes := enum_def.e_path :: !boot_classes;
				let deps = generate_enum_files common_ctx enum_def super_deps meta in
				exe_classes := (enum_def.e_path, deps) :: !exe_classes;
			end
		| TTypeDecl _ -> (* already done *) ()
		);
	) common_ctx.types;

   
	(match common_ctx.main with
	| None -> generate_dummy_main common_ctx
	| Some e ->
		let main_field = { cf_name = "__main__"; cf_type = t_dynamic; cf_expr = Some e; cf_pos = e.epos; cf_public = true; cf_meta = []; cf_doc = None; cf_kind = Var { v_read = AccNormal; v_write = AccNormal; }; cf_params = [] } in
		let class_def = { null_class with cl_path = ([],"@Main"); cl_ordered_statics = [main_field] } in
		main_deps := find_referenced_types common_ctx (TClassDecl class_def) super_deps constructor_deps false;
		generate_main common_ctx member_types super_deps class_def
	);

	generate_boot common_ctx !boot_classes !init_classes;

	write_resources common_ctx;


	let output_name = match  common_ctx.main_class with
	| Some path -> (snd path)
	| _ -> "output" in

	write_build_data (common_ctx.file ^ "/Build.xml") !exe_classes !main_deps !build_xml output_name;
	write_build_options (common_ctx.file ^ "/Options.txt") common_ctx.defines;
	if ( not (Common.defined common_ctx "no-compilation") ) then begin
		let old_dir = Sys.getcwd() in
		Sys.chdir common_ctx.file;
		let cmd = ref "haxelib run hxcpp Build.xml haxe" in
		if (common_ctx.debug) then cmd := !cmd ^ " -Ddebug";
		PMap.iter ( fun name _ -> cmd := !cmd ^ " -D" ^ name ^ "" ) common_ctx.defines;
		print_endline !cmd;
		if Sys.command !cmd <> 0 then failwith "Build failed";
		Sys.chdir old_dir;
	end
	;;

*)