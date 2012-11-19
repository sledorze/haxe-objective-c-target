
#import <Foundation/Foundation.h>


@interface NSArray ( Array )

@property (nonatomic, strong) NSMutableArray *nativeArray;
@property (nonatomic) int length;
- (NSMutabeArray*) initWithNSMutableArray:(NSMutableArray*)array;
- (NSMutabeArray*) concat:(NSMutabeArray*)a;
- (NSMutabeArray*) copy;
- (id) iterator;
- (void) insert:(int)pos x:(id)x;
- (NSString*) join:(NSString*)sep;
- (NSString*) toString;
- (id) pop;
- (int) push:(id)x;
- (void) unshift:(id)x;
- (BOOL) remove:(id)x;
- (void) reverse;
- (id) shift;
- (NSMutabeArray*) slice:(int)pos end:(id)end;
- (void) sort:(Function*)f;
- (NSMutabeArray*) splice:(int)pos len:(int)len;

@end
