


@interface StringBuf : NSObject

@property (nonatomic, strong) NSMutabeArray *b;
- (void) add:(id)x;
- (void) addSub:(NSString*)s pos:(int)pos len:(id)len;
- (void) addChar:(int)c;
- (NSString*) toString;

@end
