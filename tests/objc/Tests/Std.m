#import "Std.h"

@implementation Std

+ (BOOL) is:(id)v t:(id)t{
	return [v isEqual "-dynamic_param-" ];
}
+ (NSMutableString*) string:(id)s{
	return [s description];
}
+ (int) int:(float)x{
	return (int)x;
}
+ (id) parseInt:(NSMutableString*)x{
	return [xintValue];
}
+ (float) parseFloat:(NSMutableString*)x{
	return [xfloatValue];
}
+ (int) random:(int)x{
	if (x <= 0) return 0;;
	srand(time(NULL));
	return rand() % x;
}

@end
