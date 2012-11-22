


@interface IntIter : NSObject

@property (nonatomic) int min;
@property (nonatomic) int max;
- (BOOL) hasNext;
- (int) next;
- (id) new:(int)min max:(int)max;

@end
