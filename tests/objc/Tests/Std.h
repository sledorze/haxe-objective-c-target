


@interface Std : NSObject

-F-
+ (BOOL) is:(id)v t:(id)t;
-F-
+ (NSMutableString*) string:(id)s;
-F-
+ (int) int:(float)x;
-F-
+ (id) parseInt:(NSMutableString*)x;
-F-
+ (float) parseFloat:(NSMutableString*)x;
-F-
+ (int) random:(int)x;

@end
