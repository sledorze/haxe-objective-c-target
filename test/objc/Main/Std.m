#import "Std.h"

@implementation Std


+ (BOOL) is:(id)v t:(id)t{
	return 	[__global__ GFA2 .__instanceof:v otherArgName:t];
}


+ (NSString*) string:(id)s{
	return ((s == nil)?@"null":	[s GFA3 .toString:]);
}


+ (int) int:(float)x{
	return 	[__global__ GFA2 .__int__:x];
}


+ (**) parseInt:(NSString*)x{
	return 	[__global__ GFA2 .__hxcpp_parse_int:x];
}


+ (float) parseFloat:(NSString*)x{
	return 	[__global__ GFA2 .__hxcpp_parse_float:x];
}


+ (int) random:(int)x{
	if(x <= 0) 	return 0;
	return 	[__global__ GFA2 .__hxcpp_irand:x];
}



@end
