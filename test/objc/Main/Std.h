

#import "Array.h"
#import "Std.h"
#import "Main.h"

@interface Std

-F-
+ (BOOL) is:(id)v t:(id)t;-F-
+ (NSString*) string:(id)s;-F-
+ (int) int:(float)x;-F-
+ (**) parseInt:(NSString*)x;-F-
+ (float) parseFloat:(NSString*)x;-F-
+ (int) random:(int)x;

@end
