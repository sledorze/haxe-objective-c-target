

#import "Std.h"

@interface StringBuf : NSObject

@property (nonatomic, strong) NSMutableString *b;
- (void) add:(id)x;
- (void) addChar:(int)c;
- (void) addSub:(NSMutableString*)s pos:(int)pos len:(id)len;
- (NSMutableString*) toString;
- (id) new;

@end
