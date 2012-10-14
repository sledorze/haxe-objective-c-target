#import "Std.h"

@implementation Std


+ (BOOL) _is_v:(**)v t:(**)t{
	return __global__.__instanceof[v t];
}



+ (NSString*) string_s:(**)s{
	return ((s == nil)?@"null":s.toString[]);
}



+ (NSNumber*) _int_x:(NSNumber*)x{
	return __global__.__int__[x];
}



+ (**) _parseInt_x:(NSString*)x{
	return __global__.__hxcpp_parse_int[x];
}



+ (NSNumber*) _parseFloat_x:(NSString*)x{
	return __global__.__hxcpp_parse_float[x];
}



+ (NSNumber*) random_x:(NSNumber*)x{
	return __global__.rand[] % x;
}


{
{

@end
