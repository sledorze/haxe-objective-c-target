


@interface Std : NSObject

+ (BOOL) is:(id)v t:(id)t;
+ (NSString*) string:(id)s;
+ (int) int:(float)x;
+ (id) parseInt:(NSString*)x;
+ (float) parseFloat:(NSString*)x;
+ (int) random:(int)x;

@end
