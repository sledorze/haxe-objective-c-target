

#import "Array.h"

@interface Array

-F-
@property (nonatomic, strong) NSMutableArray *__a;-F-
@property (nonatomic) int length;-F-
- (Array*) fromNativeArray:(NSMutableArray*)array;-F-
- (Array*) concat:(Array*)a;-F-
- (Array*) copy;-F-
- (id) iterator;-F-
- (void) insert:(int)pos x:(**)x;-F-
- (NSString*) join:(NSString*)sep;-F-
- (NSString*) toString;-F-
- (**) pop;-F-
- (int) push:(**)x;-F-
- (void) unshift:(**)x;-F-
- (BOOL) remove:(**)x;-F-
- (void) reverse;-F-
- (**) shift;-F-
- (Array*) slice:(int)pos end:(**)end;-F-
- (void) sort:(Function*)f;-F-
- (Array*) splice:(int)pos len:(int)len;-F-
- (int) getLength;

@end
