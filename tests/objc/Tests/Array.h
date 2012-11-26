

#import "Array.h"

@interface NSMutableArray ( Array )

-F-
@property (nonatomic) int length;
-F-
- (NSMutabeArray*) concat:(NSMutabeArray*)a;
-F-
- (NSMutabeArray*) copy;
-F-
- (id) iterator;
-F-
- (void) insert:(int)pos x:(id)x;
-F-
- (NSMutableString*) join:(NSMutableString*)sep;
-F-
- (NSMutableString*) toString;
-F-
- (id) pop;
-F-
- (int) push:(id)x;
-F-
- (void) unshift:(id)x;
-F-
- (BOOL) remove:(id)x;
-F-
- (void) reverse;
-F-
- (id) shift;
-F-
- (NSMutabeArray*) slice:(int)pos end:(id)end;
-F-
- (void) sort:(Function*)f;
-F-
- (NSMutabeArray*) splice:(int)pos len:(int)len;
-F-
- (id) new;

@end
