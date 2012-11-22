


@interface IntIter : NSObject

- (void) new:(int)min max:(int)max;
@property (nonatomic) int min;
@property (nonatomic) int max;
- (BOOL) hasNext;
- (int) next;

@end
