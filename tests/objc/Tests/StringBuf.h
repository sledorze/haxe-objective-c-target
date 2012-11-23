

#import "Array.h"

@interface StringBuf : NSObject

@property (nonatomic, strong) NSMutabeArray *b;
- (void) add:(id)x;
- (void) addSub:(NSMutableString*)s pos:(int)pos len:(id)len;
- (void) addChar:(int)c;
- (NSMutableString*) toString;
- (id) new;

@end
