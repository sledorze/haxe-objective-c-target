#import "Tests.h"

@implementation Tests

-F-
+ (NSMutableString*) staticVar1:(NSMutableString*)val {
	static NSMutableString *_val;
	if (val == nil) { if (_val == nil) _val =  "-V-Const>"  "-E-Const>" @"abcd"; }
	else { if (_val != nil) _val = val; }
	return _val;
}
-F-
+ (int) staticVar2:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val =  "-V-Const>"  "-E-Const>" 5; }
	else { if (_val != nil) _val = val; }
	return _val;
}
-F-
+ (int) staticVar3:(int)val {
	static int _val;
	if (val == nil) { if (_val == nil) _val =  "-V-Const>"  "-E-Const>" 5; }
	else { if (_val != nil) _val = val; }
	return _val;
}
-F-

-F-
@synthesize interfaceVar1;
-F-
@synthesize interfaceVar2;
-F-

-F-
@synthesize d1;
-F-
@synthesize d2;
-F-
@synthesize s;
-F-
- (void) testVariables "-E-Block>" {
	 "-E-Vars>" 
	NSMutabeArray *a =  "-V-New>"  "-E-New>" [[NSMutabeArray alloc] new];
	 "-E-Vars>" int b =  "-V-Const>"  "-E-Const>" 5;
	 "-E-Vars>" float c =  "-V-Const>"  "-E-Const>" 5.0;
	 "-E-Vars>" 
	NSMutableString *d =  "-V-Const>"  "-E-Const>" @"xyz";
	 "-E-Vars>" BOOL e =  "-V-Const>"  "-E-Const>" YES;
	 "-E-Vars>" int f;
	 "-E-Vars>" int g =  "-V-Cast>" (int) "-V-Const>"  "-E-Const>" 5.3;
	 "-E-Vars>" id g1 =  "-V-Cast>" (id) "-V-Const>"  "-E-Const>" 6.3;
	 "-E-Vars>" id g2 =  "-V-Cast>" (id) "-V-Local>"  "-E-Local>" a;
	 "-E-Vars>" int xy =  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" a "-FA-" .length;
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" a "-FA-"  push: "-V-Const>"  "-E-Const>" @"6"];
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" a "-FA-" .length > "-gen_val_op-" "-V-Const>"  "-E-Const>" 3)  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" f = "-gen_val_op-" "-V-Const>"  "-E-Const>" 3;
	else  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" f = "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" a "-FA-" .length;
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" f = "-gen_val_op-" "-V-If>" ( "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" a "-FA-" .length > "-gen_val_op-" "-V-Const>"  "-E-Const>" 3) ?  "-V-Const>"  "-E-Const>" 3 :  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" a "-FA-" .length);
	 "-E-Vars>" int x =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-New>"  "-E-New>" [[Tests alloc] new] "-FA-"  add: "-V-Const>"  "-E-Const>" 1 b: "-V-Const>"  "-E-Const>" 1];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Lib "-FA-"  isIpad];
}
-F-
- (void) testingFor "-E-Block>" {
	 "-E-Vars>" 
	NSMutabeArray *aa =  "-V-ArrayDecl>"  "-E-ArrayDecl>" [[NSMutableArray alloc] initWithObjects: "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:1],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:2],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:3],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:4],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:5], nil]];
	 "-E-Block>" {
		 "-E-Vars>" int _g =  "-V-Const>"  "-E-Const>" 0;
		 "-E-While>" while "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" _g < "-gen_val_op-" "-V-Const>"  "-E-Const>" 5)  "-E-Block>" {
			 "-E-Vars>" int i =  "-V-Unop>"  "-E-Unop>"  "-V-Local>"  "-E-Local>" _g++;
			 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" aa "-FA-"  push: "-V-Local>"  "-E-Local>" i];
		}
	}
	 "-E-Block>" {
		 "-E-Vars>" int _g1 =  "-V-Const>"  "-E-Const>" 0; int _g =  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" aa "-FA-" .length;
		 "-E-While>" while "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" _g1 < "-gen_val_op-" "-V-Local>"  "-E-Local>" _g)  "-E-Block>" {
			 "-E-Vars>" int i =  "-V-Unop>"  "-E-Unop>"  "-V-Local>"  "-E-Local>" _g1++;
			 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" aa "-FA-"  push: "-V-Local>"  "-E-Local>" i];
		}
	}
	 "-E-Block>" {
		 "-E-Vars>" int _g =  "-V-Const>"  "-E-Const>" 0;
		 "-E-While>" while "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" _g < "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" aa "-FA-" .length)  "-E-Block>" {
			 "-E-Vars>" int i =  "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" aa objectAtIndex: "-V-Local>"  "-E-Local>" _g];
			 "-E-Unop>" ++ "-V-Local>"  "-E-Local>" _g;
			 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" aa "-FA-"  push: "-V-Local>"  "-E-Local>" i];
		}
	}
}
-F-
- (void) testWhile "-E-Block>" {
	 "-E-Vars>" int aa =  "-V-Const>"  "-E-Const>" 5;
	 "-E-While>" do  "-E-Block>" {
		 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Log "-FA-"  trace: "-V-Const>"  "-E-Const>" @"something" infos: "-V-ObjectDecl>"  "-E-ObjectDecl>" [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"73",@"Tests",@"testWhile",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
		 "-E-Unop>"  "-V-Local>"  "-E-Local>" aa++;
	}while "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" aa < "-gen_val_op-" "-V-Const>"  "-E-Const>" 10);
}
-F-
- (void) testTry "-E-Block>" {
	 "-E-Try>" @try  "-E-Block>" {
		 "-E-Vars>" int a =  "-V-Const>"  "-E-Const>" 3;
	}
	@catch (NSException *e)  "-E-Block>" {
		 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Log "-FA-"  trace: "-V-Const>"  "-E-Const>" @"error" infos: "-V-ObjectDecl>"  "-E-ObjectDecl>" [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"86",@"Tests",@"testTry",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	}
}
-F-
- (void) testSwitch "-E-Block>" {
	 "-E-Switch>" switch "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Const>"  "-E-Const>" YES){
		case  "-V-Const>"  "-E-Const>" YES:{
			 "-E-Block>" {
				 "-E-Vars>" int x =  "-V-Const>"  "-E-Const>" 0;
			}}break;
		case  "-V-Const>"  "-E-Const>" NO:{
			 "-E-Block>" {
				 "-E-Vars>" int y =  "-V-Const>"  "-E-Const>" 0;
			}}break;
	}
}
-F-
- (void) testArray "-E-Block>" {
	 "-E-Vars>" 
	NSMutabeArray *as =  "-V-New>"  "-E-New>" [[NSMutabeArray alloc] new];
	 "-E-Vars>" 
	NSMutabeArray *aa =  "-V-ArrayDecl>"  "-E-ArrayDecl>" [[NSMutableArray alloc] initWithObjects: "-V-Const>"  "-E-Const>" [NSNumber numberWithFloat:1.0],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:2],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:3],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:4],  "-V-Const>"  "-E-Const>" [NSNumber numberWithInt:5], nil]];
	 "-E-Vars>" float aaa =  "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" aa objectAtIndex: "-V-Const>"  "-E-Const>" 2];
	 "-E-Array>" [ "-V-Local>"  "-E-Local>" aa objectAtIndex: "-V-Const>"  "-E-Const>" 3];
}
-F-
- (void) testDate "-E-Block>" {
	 "-E-Vars>" 
	NSDate *d =  "-V-New>"  "-E-New>" [[NSDate alloc] new: "-V-Const>"  "-E-Const>" 2012, "-V-Const>"  "-E-Const>" 11, "-V-Const>"  "-E-Const>" 13, "-V-Const>"  "-E-Const>" 19, "-V-Const>"  "-E-Const>" 30, "-V-Const>"  "-E-Const>" 0];
	 "-E-Vars>" 
	NSDate *d2 =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" NSDate "-FA-" now];
	 "-E-Vars>" int x =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" DateTools "-FA-"  getMonthDays: "-V-Local>"  "-E-Local>" d2];
}
-F-
- (void) testEnum "-E-Block>" {
}
-F-
- (void) testEReg "-E-Block>" {
}
-F-
- (void) testHash "-E-Block>" {
	 "-E-Vars>" 
	Hash *h =  "-V-New>"  "-E-New>" [[Hash alloc] new];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" h "-FA-"  set: "-V-Const>"  "-E-Const>" @"key" value: "-V-Const>"  "-E-Const>" @"value"];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" h "-FA-"  get: "-V-Const>"  "-E-Const>" @"key"];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" h "-FA-"  remove: "-V-Const>"  "-E-Const>" @"key"];
	 "-E-Vars>" BOOL b =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" h "-FA-"  exists: "-V-Const>"  "-E-Const>" @"key"];
	 "-E-Vars>" id arr =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" h "-FA-"  keys];
	 "-E-Vars>" id iter =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" h "-FA-"  iterator];
	 "-E-Vars>" 
	NSMutableString *str =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" h "-FA-"  toString];
	 "-E-Vars>" 
	IntHash *hi =  "-V-New>"  "-E-New>" [[IntHash alloc] new];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" hi "-FA-"  set: "-V-Const>"  "-E-Const>" 0 value: "-V-Const>"  "-E-Const>" @"value"];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" hi "-FA-"  get: "-V-Const>"  "-E-Const>" 0];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" hi "-FA-"  remove: "-V-Const>"  "-E-Const>" 0];
	 "-E-Vars>" BOOL bi =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" hi "-FA-"  exists: "-V-Const>"  "-E-Const>" 0];
	 "-E-Vars>" id arri =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" hi "-FA-"  keys];
	 "-E-Vars>" id iteri =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" hi "-FA-"  iterator];
	 "-E-Vars>" 
	NSMutableString *stri =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" hi "-FA-"  toString];
}
-F-
- (void) testLambda "-E-Block>" {
}
-F-
- (void) testList "-E-Block>" {
}
-F-
- (void) testMath "-E-Block>" {
	 "-E-Vars>" float pi =  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" M_PI;
	 "-E-Vars>" float max =  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" -DBL_MAX;
	 "-E-Vars>" float min =  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" DBL_MAX;
	 "-E-Vars>" float nan =  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" NaN;
	 "-E-Vars>" float x =  "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" sqrtf( "-V-Const>"  "-E-Const>" 5);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" absf( "-V-Const>"  "-E-Const>" 5);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" fmaxf( "-V-Const>"  "-E-Const>" 5,  "-V-Const>"  "-E-Const>" 45555);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" fminf( "-V-Const>"  "-E-Const>" 5,  "-V-Const>"  "-E-Const>" 45555);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" sinf( "-V-Const>"  "-E-Const>" 5);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" cosf( "-V-Const>"  "-E-Const>" 5);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" atan2f( "-V-Const>"  "-E-Const>" 5,  "-V-Const>"  "-E-Const>" 3);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" tanf( "-V-Const>"  "-E-Const>" 5);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" expf( "-V-Const>"  "-E-Const>" 5);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" logf( "-V-Const>"  "-E-Const>" 5);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" sqrtf( "-V-Const>"  "-E-Const>" 5);
	 "-E-Vars>" int xr =  "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" roundf( "-V-Const>"  "-E-Const>" 5);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" xr = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" floorf( "-V-Const>"  "-E-Const>" 5);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" xr = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" ceilf( "-V-Const>"  "-E-Const>" 5);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" atanf( "-V-Const>"  "-E-Const>" 5);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" asinf( "-V-Const>"  "-E-Const>" 5);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" acosf( "-V-Const>"  "-E-Const>" 5);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" powf( "-V-Const>"  "-E-Const>" 5,  "-V-Const>"  "-E-Const>" 4);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x = "-gen_val_op-" "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" rand() * "-gen_val_op-" "-V-Const>"  "-E-Const>" 5;
	 "-E-Vars>" BOOL b =  "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" isfinite( "-V-Const>"  "-E-Const>" 45454);
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" b = "-gen_val_op-" "-V-Call>"  "-E-Call>"  "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>"  "-FA-" isnan( "-V-Const>"  "-E-Const>" 45454);
	 "-E-Vars>" float j =  "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" x stringByAppendingString:"-gen_val_op-" "-V-Local>"  "-E-Local>" xr];
	 "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" j appendString:"-gen_val_op-" "-V-Local>"  "-E-Local>" x];
	 "-E-Vars>" float k =  "-V-If>" ( "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Local>"  "-E-Local>" b) ?  "-V-Unop>"  "-E-Unop>" - "-V-Local>"  "-E-Local>" x :  "-V-Local>"  "-E-Local>" x);
}
-F-
- (void) testReflect "-E-Block>" {
	 "-E-Vars>" id obj =  "-V-ObjectDecl>"  "-E-ObjectDecl>" {a: "-V-Const>"  "-E-Const>" @"aaaaa"};
	 "-E-Vars>" BOOL b =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Reflect "-FA-"  hasField: "-V-Local>"  "-E-Local>" obj field: "-V-Const>"  "-E-Const>" @"a"];
	 "-E-Vars>" id f =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Reflect "-FA-"  field: "-V-Local>"  "-E-Local>" obj field: "-V-Const>"  "-E-Const>" @"a"];
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" obj != "-gen_val_op-" "-V-Const>"  "-E-Const>" nil)  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" obj "-FA-"  GFA2 .__SetField "-dynamic_param-" ];;
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .__SetField "-dynamic_param-" ];
	 "-E-Vars>" id p =  "-V-Cast>" (id) "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .__Field "-dynamic_param-" ];
}
-F-
- (void) testStd "-E-Block>" {
}
-F-
- (void) testString "-E-Block>" {
	 "-E-Vars>" 
	NSMutableString *string =  "-V-New>"  "-E-New>" [[NSMutableString alloc] new: "-V-Const>"  "-E-Const>" @"abcdefghijklmnopqrstuvwxyz"];
	 "-E-Vars>" int len =  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" string "-FA-" length;
	 "-E-Vars>" 
	NSMutableString *s =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" string "-FA-"  characterAtIndex: "-V-Const>"  "-E-Const>" 5];
	 "-E-Vars>" id ch =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" string "-FA-"  characterAtIndex: "-V-Const>"  "-E-Const>" 5];
	 "-E-Vars>" int i =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" string "-FA-"  rangeOfString: "-V-Const>"  "-E-Const>" @"abc" startIndex: "-V-Const>"  "-E-Const>" nil];
	 "-E-Vars>" int i1 =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" string "-FA-"  rangeOfString: "-V-Const>"  "-E-Const>" @"abc" startIndex: "-V-Const>"  "-E-Const>" 2];
	 "-E-Vars>" int li =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" string "-FA-"  rangeOfString options:NSBackwardsSearch: "-V-Const>"  "-E-Const>" @"abc" startIndex: "-V-Const>"  "-E-Const>" nil];
	 "-E-Vars>" 
	NSMutabeArray *components =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" string "-FA-"  componentsSeparatedByString: "-V-Const>"  "-E-Const>" @"-"];
	 "-E-Vars>" 
	NSMutableString *s2 =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" string "-FA-"  substringWithRange: "-V-Const>"  "-E-Const>" 5 len: "-V-Const>"  "-E-Const>" nil];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" s2 = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" string "-FA-"  substringWithRange: "-V-Const>"  "-E-Const>" 5 len: "-V-Local>"  "-E-Local>" len];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" s2 = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" string "-FA-"  substringWithRange: "-V-Const>"  "-E-Const>" 5 endIndex: "-V-Const>"  "-E-Const>" nil];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" s2 = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" string "-FA-"  substringWithRange: "-V-Const>"  "-E-Const>" 1 endIndex: "-V-Local>"  "-E-Local>" len];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" s2 = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" string "-FA-"  lowercaseString];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" s2 = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" string "-FA-"  uppercaseString];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" s2 = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" string "-FA-"  description];
	 "-E-Vars>" 
	NSMutableString *s3 =  "-V-Const>"  "-E-Const>" @"\t";
	 "-E-Vars>" 
	StringBuf *buf =  "-V-New>"  "-E-New>" [[StringBuf alloc] new];
	 "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" buf "-FA-" .b appendString:"-gen_val_op-" "-V-Const>"  "-E-Const>" @"abc"];
	 "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" buf "-FA-" .b appendString:"-gen_val_op-" "-V-Const>"  "-E-Const>" @""];
	 "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" buf "-FA-" .b appendString:"-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" @"abcdefghijklmnopqerstuvwxyz" "-FA-"  substringWithRange: "-V-Const>"  "-E-Const>" 5 len: "-V-Const>"  "-E-Const>" nil]];
	 "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" buf "-FA-" .b appendString:"-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" @"abcdefghijklmnopqerstuvwxyz" "-FA-"  substringWithRange: "-V-Const>"  "-E-Const>" 5 len: "-V-Const>"  "-E-Const>" 10]];
	 "-E-Vars>" 
	NSMutableString *strbuf =  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" buf "-FA-" .b;
	 "-E-Vars>" 
	NSMutableString *st =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  urlEncode: "-V-Const>"  "-E-Const>" @"http://imagin.ro/Gorgeous Elena/2"];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" st = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  urlDecode: "-V-Const>"  "-E-Const>" @"http://imagin.ro/Gorgeous Elena/2"];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" st = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  htmlEscape: "-V-Const>"  "-E-Const>" @"<a href= &>"];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" st = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  htmlUnescape: "-V-Const>"  "-E-Const>" @"<a href= &>"];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" st = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  ltrim: "-V-Const>"  "-E-Const>" @" abcdefgh"];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" st = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  rtrim: "-V-Const>"  "-E-Const>" @"abcdefgh "];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" st = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  trim: "-V-Const>"  "-E-Const>" @" abcdefgh "];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" st = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  rpad: "-V-Const>"  "-E-Const>" @"abcdefgh" c: "-V-Const>"  "-E-Const>" @"0" l: "-V-Const>"  "-E-Const>" 10];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" st = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  lpad: "-V-Const>"  "-E-Const>" @"abcdefgh" c: "-V-Const>"  "-E-Const>" @"0" l: "-V-Const>"  "-E-Const>" 10];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" st = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  replace: "-V-Const>"  "-E-Const>" @"abcdefgh" sub: "-V-Const>"  "-E-Const>" @"abc" by: "-V-Const>"  "-E-Const>" @"_abc"];
	 "-E-Vars>" BOOL b =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  startsWith: "-V-Const>"  "-E-Const>" @"abcdefg" start: "-V-Const>"  "-E-Const>" @"abc"];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" b = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  endsWith: "-V-Const>"  "-E-Const>" @"abcdefg" end: "-V-Const>"  "-E-Const>" @"efg"];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" b = "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  isSpace: "-V-Const>"  "-E-Const>" @"abcdefg" pos: "-V-Const>"  "-E-Const>" 3];
	 "-E-Vars>" 
	NSMutableString *i2 =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" StringTools "-FA-"  hex: "-V-Const>"  "-E-Const>" 345345 digits: "-V-Const>"  "-E-Const>" 10];
	 "-E-Vars>" 
	NSMutableString *sfin =  "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" strbuf stringByAppendingString:"-gen_val_op-" "-V-Local>"  "-E-Local>" st];
	 "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" sfin = "-gen_val_op-" "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" strbuf stringByAppendingString:"-gen_val_op-" "-V-Local>"  "-E-Local>" st] stringByAppendingString:"-gen_val_op-" "-V-Local>"  "-E-Local>" s2];
	 "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" sfin appendString:"-gen_val_op-" "-V-Const>"  "-E-Const>" @"abc"];
}
-F-
- (void) testSys "-E-Block>" {
}
-F-
- (void) testType "-E-Block>" {
}
-F-
- (void) testXml "-E-Block>" {
}
-F-
- (void) testFrameworksImport "-E-Block>" {
	 "-E-Vars>" 
	MKMapView *m =  "-V-New>"  "-E-New>" [[MKMapView alloc] new];
}
-F-
- (int) getWidth "-E-Block>" {
	 "-E-Return>" return  "-V-Const>"  "-E-Const>" 0;
}
-F-
- (int) setWidth:(int)v "-E-Block>" {
	 "-E-Return>" return  "-V-Const>"  "-E-Const>" 0;
}
-F-
- (int) add:(int)a b:(int)b "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" ["-gen_val_op-" "-V-Local>"  "-E-Local>" a stringByAppendingString:"-gen_val_op-" "-V-Local>"  "-E-Local>" b];
}
-F-
- (int) minus:(int)a b:(int)b "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" a - "-gen_val_op-" "-V-Local>"  "-E-Local>" b;
}
-F-
- (void) callLotsOfArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4 "-E-Block>" {
}
-F-
- (void) optionalArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(id)arg4 "-E-Block>" {
}
-F-
- (void) optionalArguments1:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4 "-E-Block>" {
}
-F-
- (void) optionalArguments2:(int)arg1 arg2:(id)arg2 arg3:(id)arg3 arg4:(int)arg4 "-E-Block>" {
}
-F-
- (void) optionalArguments3:(int)arg1 arg2:(int)arg2 arg3:(id)arg3 arg4:(int)arg4 "-E-Block>" {
}
-F-
- (void) init "-E-Block>" {
	 "-E-Vars>" int x =  "-V-Const>"  "-E-Const>" 6;
	 "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .s = "-gen_val_op-" "-V-Const>"  "-E-Const>" @"init";
}
-F-
- (void) printHello "-E-Block>" {
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Log "-FA-"  trace: "-V-Const>"  "-E-Const>" @"Hello from Haxe Objective-C" infos: "-V-ObjectDecl>"  "-E-ObjectDecl>" [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"349",@"Tests",@"printHello",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
}
-F-
- (id) new "-E-Block>" {
	self = [super init];
	 "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .s = "-gen_val_op-" "-V-Const>"  "-E-Const>" @"str";
	 "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .d2 = "-gen_val_op-" "-V-Const>"  "-E-Const>" 4.5;
	 "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .d1 = "-gen_val_op-" "-V-Const>"  "-E-Const>" 34;
	return self;
}

@end
