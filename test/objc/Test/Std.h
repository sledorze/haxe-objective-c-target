
#import "Interface2.h"

@interface Std


+ (BOOL) _is:(id)v t:(id)t;

+ (NSString*) string:(id)s;

+ (int) _int:(float)x;

+ (**) _parseInt:(NSString*)x;

+ (float) _parseFloat:(NSString*)x;

+ (int) random:(int)x;


@end
