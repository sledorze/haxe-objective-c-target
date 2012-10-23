#import "Std.h"

@implementation Std


+ (BOOL) is:(id)v t:(id)t{
	return 	[GEN_M_CALL>Field>__global__ GFA2 .__instanceof:2Local>Local>TMono];
}


+ (NSString*) string:(id)s{
	return ( (s == nil)?@"null":	[GEN_M_CALL>Field>s GFA3 .toString:0TDynamic]);
}


+ (int) int:(float)x{
	return 	[GEN_M_CALL>Field>__global__ GFA2 .__int__:1Local>TMono];
}


+ (**) parseInt:(NSString*)x{
	return 	[GEN_M_CALL>Field>__global__ GFA2 .__hxcpp_parse_int:1Local>TMono];
}


+ (float) parseFloat:(NSString*)x{
	return 	[GEN_M_CALL>Field>__global__ GFA2 .__hxcpp_parse_float:1Local>TMono];
}


+ (int) random:(int)x{
	if (x <= 0) 	return 0;
	return 	[GEN_M_CALL>Field>__global__ GFA2 .__hxcpp_irand:1Local>TMono];
}



@end
