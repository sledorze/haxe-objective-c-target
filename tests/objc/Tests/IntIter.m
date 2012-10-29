#import "IntIter.h"

@implementation IntIter



@synthesize min;
@synthesize max;
- (BOOL) hasNext{
	return self.min < self.max;
}
- (int) next{
	return self.min++;
}

@end
