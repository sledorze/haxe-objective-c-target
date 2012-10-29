
#import <Foundation/Foundation.h>


@interface Array

@property (nonatomic, strong) NSMutableArray *__a;
@property (nonatomic) int length;
- (Array*) initWithNSMutableArray:(NSMutableArray*)array;
- (Array*) concat:(Array*)a;
- (Array*) copy;
- (id) iterator;
- (void) insert:(int)pos x:(id)x;
- (NSString*) join:(NSString*)sep;
- (NSString*) toString;
- (id) pop;
- (int) push:(id)x;
- (Array*) add:(id)x;
- (void) unshift:(id)x;
- (BOOL) remove:(id)x;
- (void) reverse;
- (id) shift;
- (Array*) slice:(int)pos end:(id)end;
- (void) sort:(Function*)f;
- (Array*) splice:(int)pos len:(int)len;
- (int) getLength;

@end
