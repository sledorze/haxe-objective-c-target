#import "Std.h"

@implementation Std
+ (BOOL) is:(id)v t:(id)t{
	return [__global__ GFA2 .__instanceofnon-];
}
+ (NSString*) string:(id)s{
	return ( (s == nil) ? @"null" : [s GFA3 .toString]);
}
+ (int) int:(float)x{
	return [__global__ GFA2 .__int__non-];
}
+ (id) parseInt:(NSString*)x{
	return [__global__ GFA2 .__hxcpp_parse_intnon-];
}
+ (float) parseFloat:(NSString*)x{
	return [__global__ GFA2 .__hxcpp_parse_floatnon-];
}
+ (int) random:(int)x{
	if (x <= 0) return 0;;
	return [__global__ GFA2 .__hxcpp_irandnon-];
}

@end
