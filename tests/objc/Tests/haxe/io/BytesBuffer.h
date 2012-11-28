

#import "Array.h"
#import "Bytes.h"
#import "Error.h"

@interface BytesBuffer : NSObject

@property (nonatomic, strong) NSMutabeArray *b;
- (void) addByte:(int)byte;
- (void) add:(Bytes*)src;
- (void) addBytes:(Bytes*)src pos:(int)pos len:(int)len;
- (Bytes*) getBytes;
- (id) new;

@end
