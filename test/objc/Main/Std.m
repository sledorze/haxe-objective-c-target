#import "Std.h"

@implementation Std

-F-
+ (BOOL) is:(id)v t:(id)t-E-Block>{
-E-Return>	return -V-Call>-E-Call>	[-CALL-Field>-V-Field>-E-Field>-V-Local>-E-Local>__global__ GFA2 .__instanceof:2Local>Local>TMono];
}
-F-
+ (NSString*) string:(id)s-E-Block>{
-E-Return>	return -V-If>(-V-Parenthesis>-E-Parenthesis> (-V-Binop>-E-Binop>-V-Local>-E-Local>s == -V-Const>-E-Const>nil)?-V-Const>-E-Const>@"null":-V-Call>-E-Call>	[-CALL-Field>-V-Field>-E-Field>-V-Local>-E-Local>s GFA3 .toString:0TDynamic]);
}
-F-
+ (int) int:(float)x-E-Block>{
-E-Return>	return -V-Call>-E-Call>	[-CALL-Field>-V-Field>-E-Field>-V-Local>-E-Local>__global__ GFA2 .__int__:1Local>TMono];
}
-F-
+ (**) parseInt:(NSString*)x-E-Block>{
-E-Return>	return -V-Call>-E-Call>	[-CALL-Field>-V-Field>-E-Field>-V-Local>-E-Local>__global__ GFA2 .__hxcpp_parse_int:1Local>TMono];
}
-F-
+ (float) parseFloat:(NSString*)x-E-Block>{
-E-Return>	return -V-Call>-E-Call>	[-CALL-Field>-V-Field>-E-Field>-V-Local>-E-Local>__global__ GFA2 .__hxcpp_parse_float:1Local>TMono];
}
-F-
+ (int) random:(int)x-E-Block>{
-E-If>	if-V-Parenthesis>-E-Parenthesis> (-V-Binop>-E-Binop>-V-Local>-E-Local>x <= -V-Const>-E-Const>0) -E-Return>	return -V-Const>-E-Const>0;
-E-Return>	return -V-Call>-E-Call>	[-CALL-Field>-V-Field>-E-Field>-V-Local>-E-Local>__global__ GFA2 .__hxcpp_irand:1Local>TMono];
}


@end
