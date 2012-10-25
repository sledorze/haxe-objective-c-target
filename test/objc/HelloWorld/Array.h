

#import "CustomMapView.h"

@interface Array


@property (nonatomic, strong) NSMutableArray *__a;
@property (nonatomic) int length;
- (Array*) initWithNSMutableArray:(NSMutableArray*)array;
- (Array*) concat:(Array*)a;
- (Array*) copy;
- (id) iterator;
- (void) insert:(int)pos x:(**)x;
- (NSString*) join:(NSString*)sep;
- (NSString*) toString;
- (**) pop;
- (int) push:(**)x;
- (void) unshift:(**)x;
- (BOOL) remove:(**)x;
- (void) reverse;
- (**) shift;
- (Array*) slice:(int)pos end:(**)end;
- (void) sort:(Function*)f;
- (Array*) splice:(int)pos len:(int)len;
- (int) getLength;

@end
