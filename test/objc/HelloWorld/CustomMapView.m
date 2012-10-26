#import "CustomMapView.h"

@implementation CustomMapView



- (void) locateLondon{
	[self.locate:50.8 long:-0.5 zoom:1.2];
}

- (void) locate:(float)lat long:(float)long zoom:(float)zoom{
}


@end
