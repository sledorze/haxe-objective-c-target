


@interface Std : NSObject

+ (BOOL) is:(id)v t:(id)t;
+ (NSMutableString*) string:(id)s;
+ (int) int:(float)x;
+ (id) parseInt:(NSMutableString*)x;
+ (float) parseFloat:(NSMutableString*)x;
+ (int) random:(int)x;

@end
