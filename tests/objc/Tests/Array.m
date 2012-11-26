#import "Array.h"

@implementation Array

-F-
@synthesize length;
-F-
- (NSMutabeArray*) concat:(NSMutabeArray*)a "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .arrayByAddingObjectsFromArray "-dynamic_param-" ];
}
-F-
- (NSMutabeArray*) copy "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" NSMutabeArray "-FA-"  arrayWithArray "-dynamic_param-" ];
}
-F-
- (id) iterator "-E-Block>" {
	 "-E-Return>" return  "-V-ObjectDecl>"  "-E-ObjectDecl>" {a: "-V-Const>"  "-E-Const>" self ,p: "-V-Const>"  "-E-Const>" 0 ,hasNext: "-V-Function>"  "-E-Function>" (BOOL) "-E-Block>" {
		 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .p < "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .a "-FA-"  GFA2 .length;
	} ,next: "-V-Function>"  "-E-Function>" (id) "-E-Block>" {
		 "-E-Vars>" id i =  "-V-Array>"  "-E-Array>" [ "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .a "-FA-"  GFA2 .nativeArray objectAtIndex: "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .p];
		 "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .p appendString:"-gen_val_op-" "-V-Const>"  "-E-Const>" 1];
		 "-E-Return>" return  "-V-Local>"  "-E-Local>" i;
	}};
}
-F-
- (void) insert:(int)pos x:(id)x "-E-Block>" {
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .insertObject "-dynamic_param-" ];
}
-F-
- (NSMutableString*) join:(NSMutableString*)sep "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .componentsJoinedByString "-dynamic_param-" ];
}
-F-
- (NSMutableString*) toString "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Const>"  "-E-Const>" @"[" stringByAppendingString:"-gen_val_op-" "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .componentsJoinedByString "-dynamic_param-" ] stringByAppendingString:"-gen_val_op-" "-V-Const>"  "-E-Const>" @"]"])];
}
-F-
- (id) pop "-E-Block>" {
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .length == "-gen_val_op-" "-V-Const>"  "-E-Const>" 0)  "-E-Return>" return  "-V-Const>"  "-E-Const>" nil;;
	 "-E-Vars>" id theLastObject =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .lastObject];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .removeLastObject];
	 "-E-Return>" return  "-V-Local>"  "-E-Local>" theLastObject;
}
-F-
- (int) push:(id)x "-E-Block>" {
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .addObject "-dynamic_param-" ];
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .count];
}
-F-
- (void) unshift:(id)x "-E-Block>" {
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .insertObject "-dynamic_param-" ];
}
-F-
- (BOOL) remove:(id)x "-E-Block>" {
	 "-E-Vars>" BOOL containsObject =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .containsObject "-dynamic_param-" ];
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Local>"  "-E-Local>" containsObject)  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .removeObject "-dynamic_param-" ];;
	 "-E-Return>" return  "-V-Local>"  "-E-Local>" containsObject;
}
-F-
- (void) reverse "-E-Block>" {
	 "-E-Vars>" id reverseArray =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .reverseObjectEnumerator] "-FA-"  GFA2 .allObjects];
}
-F-
- (id) shift "-E-Block>" {
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .count] > "-gen_val_op-" "-V-Const>"  "-E-Const>" 0)  "-E-Block>" {
		 "-E-Vars>" id obj =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .objectAtIndex "-dynamic_param-" ];
		 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .removeObjectAtIndex "-dynamic_param-" ];
		 "-E-Return>" return  "-V-Local>"  "-E-Local>" obj;
	};;
	 "-E-Return>" return  "-V-Const>"  "-E-Const>" nil;
}
-F-
- (NSMutabeArray*) slice:(int)pos end:(id)end "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .splice: "-V-Local>"  "-E-Local>" pos len: "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" end - "-gen_val_op-" "-V-Local>"  "-E-Local>" pos];
}
-F-
- (void) sort:(Function*)f "-E-Block>" {
}
-F-
- (NSMutabeArray*) splice:(int)pos len:(int)len "-E-Block>" {
	 "-E-Vars>" 
	NSMutabeArray *newArray =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .subarrayWithRange "-dynamic_param-" ];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .removeObjectsInArray "-dynamic_param-" ];
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" NSMutabeArray "-FA-"  arrayWithArray "-dynamic_param-" ];
}
-F-
- (id) new "-E-Block>" {
	self = [super init];
	return self;
}

@end
