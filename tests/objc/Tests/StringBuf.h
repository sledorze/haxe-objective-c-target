

#import "Std.h"

@interface StringBuf : NSObject

-F-
@property (nonatomic, strong) NSMutableString *b;
-F-
- (void) add:(id)x;
-F-
- (void) addChar:(int)c;
-F-
- (void) addSub:(NSMutableString*)s pos:(int)pos len:(id)len;
-F-
- (NSMutableString*) toString;
-F-
- (id) new;

@end
