#import "Std.h"

@implementation Std


+ (BOOL) _is:(id)v t:(id)t{
	return __global__.__instanceof[v t];
}


+ (NSString*) string:(id)s{
	return ((s == nil)?@"null":s.toString[]);
}


+ (int) _int:(float)x{
	return __global__.__int__[x];
}


+ (**) _parseInt:(NSString*)x{
	return __global__.__hxcpp_parse_int[x];
}


+ (float) _parseFloat:(NSString*)x{
	return __global__.__hxcpp_parse_float[x];
}


+ (int) random:(int)x{
	if(x <= 0) 	return 0;
	return __global__.__hxcpp_irand[x];
}



@end
