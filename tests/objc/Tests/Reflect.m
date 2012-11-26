#import "Reflect.h"

@implementation Reflect

-F-
+ (BOOL) hasField:(id)o field:(NSMutableString*)field "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" o != "-gen_val_op-" "-V-Const>"  "-E-Const>" nil && "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  __HasField "-dynamic_param-" ];
}
-F-
+ (id) field:(id)o field:(NSMutableString*)field "-E-Block>" {
	 "-E-Return>" return  "-V-If>" ( "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" o == "-gen_val_op-" "-V-Const>"  "-E-Const>" nil) ?  "-V-Const>"  "-E-Const>" nil :  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  __Field "-dynamic_param-" ]);
}
-F-
+ (void) setField:(id)o field:(NSMutableString*)field value:(id)value "-E-Block>" {
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" o != "-gen_val_op-" "-V-Const>"  "-E-Const>" nil)  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  __SetField "-dynamic_param-" ];;
}
-F-
+ (id) getProperty:(id)o field:(NSMutableString*)field "-E-Block>" {
	 "-E-Return>" return  "-V-If>" ( "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" o == "-gen_val_op-" "-V-Const>"  "-E-Const>" nil) ?  "-V-Const>"  "-E-Const>" nil :  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  __Field "-dynamic_param-" ]);
}
-F-
+ (void) setProperty:(id)o field:(NSMutableString*)field value:(id)value "-E-Block>" {
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" o != "-gen_val_op-" "-V-Const>"  "-E-Const>" nil)  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  __SetField "-dynamic_param-" ];;
}
-F-
+ (id) callMethod:(id)o func:(id)func args:(NSMutabeArray*)args "-E-Block>" {
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" func != "-gen_val_op-" "-V-Const>"  "-E-Const>" nil && "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" func "-FA-"  __GetType] == "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" __global__ "-FA-"  GFA2 .vtString)  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" func = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  __Field "-dynamic_param-" ];;
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" func "-FA-"  __SetThis "-dynamic_param-" ];
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" func "-FA-"  __Run "-dynamic_param-" ];
}
-F-
+ (NSMutabeArray*) fields:(id)o "-E-Block>" {
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" o == "-gen_val_op-" "-V-Const>"  "-E-Const>" nil)  "-E-Return>" return  "-V-New>"  "-E-New>" [[NSMutabeArray alloc] new];;
	 "-E-Vars>" 
	NSMutabeArray *a =  "-V-ArrayDecl>"  "-E-ArrayDecl>" [[NSMutableArray alloc] initWithObjects:, nil]];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  __GetFields "-dynamic_param-" ];
	 "-E-Return>" return  "-V-Local>"  "-E-Local>" a;
}
-F-
+ (BOOL) isFunction:(id)f "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" f != "-gen_val_op-" "-V-Const>"  "-E-Const>" nil && "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" f "-FA-"  __GetType] == "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" __global__ "-FA-"  GFA2 .vtFunction;
}
-F-
+ (int) compare:(id)a b:(id)b "-E-Block>" {
	 "-E-Return>" return  "-V-If>" ( "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" a == "-gen_val_op-" "-V-Local>"  "-E-Local>" b) ?  "-V-Const>"  "-E-Const>" 0 :  "-V-If>" ( "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Cast>" (int) "-V-Local>"  "-E-Local>" a > "-gen_val_op-" "-V-Cast>" (int) "-V-Local>"  "-E-Local>" b) ?  "-V-Const>"  "-E-Const>" 1 :  "-V-Const>"  "-E-Const>" -1));
}
-F-
+ (BOOL) compareMethods:(id)f1 f2:(id)f2 "-E-Block>" {
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" f1 == "-gen_val_op-" "-V-Local>"  "-E-Local>" f2)  "-E-Return>" return  "-V-Const>"  "-E-Const>" YES;;
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Unop>"  "-E-Unop>" ! "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Reflect "-FA-"  isFunction: "-V-Local>"  "-E-Local>" f1] || "-gen_val_op-" "-V-Unop>"  "-E-Unop>" ! "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Reflect "-FA-"  isFunction: "-V-Local>"  "-E-Local>" f2])  "-E-Return>" return  "-V-Const>"  "-E-Const>" NO;;
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" __global__ "-FA-"  GFA2 .__hxcpp_same_closure "-dynamic_param-" ];
}
-F-
+ (BOOL) isObject:(id)v "-E-Block>" {
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" v == "-gen_val_op-" "-V-Const>"  "-E-Const>" nil)  "-E-Return>" return  "-V-Const>"  "-E-Const>" NO;;
	 "-E-Vars>" int t =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" v "-FA-"  __GetType];
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" t == "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" __global__ "-FA-"  GFA2 .vtObject || "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" t == "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" __global__ "-FA-"  GFA2 .vtClass || "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" t == "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" __global__ "-FA-"  GFA2 .vtString || "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" t == "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" __global__ "-FA-"  GFA2 .vtArray;
}
-F-
+ (BOOL) deleteField:(id)o f:(NSMutableString*)f "-E-Block>" {
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" o == "-gen_val_op-" "-V-Const>"  "-E-Const>" nil)  "-E-Return>" return  "-V-Const>"  "-E-Const>" NO;;
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" __global__ "-FA-"  GFA2 .__hxcpp_anon_remove "-dynamic_param-" ];
}
-F-
+ (id) copy:(id)o "-E-Block>" {
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" o == "-gen_val_op-" "-V-Const>"  "-E-Const>" nil)  "-E-Return>" return  "-V-Const>"  "-E-Const>" nil;;
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  __GetType] == "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" __global__ "-FA-"  GFA2 .vtString)  "-E-Return>" return  "-V-Local>"  "-E-Local>" o;;
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  __GetType] == "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" __global__ "-FA-"  GFA2 .vtArray)  "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Call>"  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o "-FA-"  __Field "-dynamic_param-" ]];;
	 "-E-Vars>" id o2 =  "-V-ObjectDecl>"  "-E-ObjectDecl>" {};
	 "-E-Block>" {
		 "-E-Vars>" int _g =  "-V-Const>"  "-E-Const>" 0; 
		NSMutabeArray *_g1 =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Reflect "-FA-"  fields: "-V-Local>"  "-E-Local>" o];
		 "-E-While>" while "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" _g < "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" _g1 "-FA-" .length)  "-E-Block>" {
			 "-E-Vars>" 
			NSMutableString *f =  "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" _g1 objectAtIndex: "-V-Local>"  "-E-Local>" _g];
			 "-E-Unop>" ++ "-V-Local>"  "-E-Local>" _g;
			 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" o2 != "-gen_val_op-" "-V-Const>"  "-E-Const>" nil)  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" o2 "-FA-"  __SetField "-dynamic_param-" ];;
		}
	}
	 "-E-Return>" return  "-V-Local>"  "-E-Local>" o2;
}
-F-
+ (id) makeVarArgs:(Function*)f "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" __global__ "-FA-"  GFA2 .__hxcpp_create_var_args "-dynamic_param-" ];
}

@end
