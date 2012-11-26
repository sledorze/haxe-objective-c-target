#import "Std.h"

@implementation Std

-F-
+ (BOOL) is:(id)v t:(id)t "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" v "-FA-"  isEqual "-dynamic_param-" ];
}
-F-
+ (NSMutableString*) string:(id)s "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-"  description];
}
-F-
+ (int) int:(float)x "-E-Block>" {
	 "-E-Return>" return  "-V-Cast>" (int) "-V-Local>"  "-E-Local>" x;
}
-F-
+ (id) parseInt:(NSMutableString*)x "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" x "-FA-" intValue];
}
-F-
+ (float) parseFloat:(NSMutableString*)x "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" x "-FA-" floatValue];
}
-F-
+ (int) random:(int)x "-E-Block>" {
	 "-E-If>" if "-V-Parenthesis>"  "-E-Parenthesis>"  ( "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" x <= "-gen_val_op-" "-V-Const>"  "-E-Const>" 0)  "-E-Return>" return  "-V-Const>"  "-E-Const>" 0;;
	 "-E-Call>" srand(time(NULL));
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" rand() % x;
}

@end
