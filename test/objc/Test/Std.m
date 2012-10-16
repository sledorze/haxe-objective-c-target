#import "Std.h"

@implementation Std


+ (BOOL) _isv:(id)v t:(id)t{
	return __global__.__instanceof[v t];
}


+ (NSString*) strings:(id)s{
	return ((s == nil)?@"null":s.toString[]);
}


+ (int) _intx:(float)x{
	return __global__.__int__[x];
}


+ (**) _parseIntx:(NSString*)x{
	return __global__.__hxcpp_parse_int[x];
}


+ (float) _parseFloatx:(NSString*)x{
	return __global__.__hxcpp_parse_float[x];
}


+ (int) randomx:(int)x{
	if(x <= 0) 	return 0;
	return __global__.__hxcpp_irand[x];
}



@end
