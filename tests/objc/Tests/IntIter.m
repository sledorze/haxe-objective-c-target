#import "IntIter.h"

@implementation IntIter

- (void) new:(int)min max:(int)max{
	self = [super init];
	self.min = min;
	self.max = max;
	return self;
}
@synthesize min;
@synthesize max;
- (BOOL) hasNext{
	return self.min < self.max;
}
- (int) next{
	return self.min++;
}

@end
