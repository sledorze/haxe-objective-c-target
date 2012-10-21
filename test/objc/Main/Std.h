

#import "Std.h"
#import "Main.h"

@interface Std


+ (BOOL) is:(id)v t:(id)t;

+ (NSString*) string:(id)s;

+ (int) int:(float)x;

+ (**) parseInt:(NSString*)x;

+ (float) parseFloat:(NSString*)x;

+ (int) random:(int)x;


@end
