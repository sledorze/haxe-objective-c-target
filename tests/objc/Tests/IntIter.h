


@interface IntIter : NSObject

-F-
@property (nonatomic) int min;
-F-
@property (nonatomic) int max;
-F-
- (BOOL) hasNext;
-F-
- (int) next;
-F-
- (id) new:(int)min max:(int)max;

@end
