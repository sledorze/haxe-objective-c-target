#import "Std.h"

@implementation Std
+ (BOOL) is:(id)v t:(id)t{
	return [v isEqual-non-];
}
+ (NSString*) string:(id)s{
	return [s description];
}
+ (int) int:(float)x{
	return (int)x;
}
+ (id) parseInt:(NSString*)x{
	return [x intValue];
}
+ (float) parseFloat:(NSString*)x{
	return [x floatValue];
}
+ (int) random:(int)x{
	if (x <= 0) return 0;;
	srand(time(NULL));
	return rand() % x;
}

@end
