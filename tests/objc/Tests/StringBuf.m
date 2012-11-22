#import "StringBuf.h"

@implementation StringBuf

- (void) new{
	self = [super init];
	self.b = [[Array alloc] new][];
	return self;
}
@synthesize b;
- (void) add:(id)x{
	[self.b objectAtIndex:self.b.length] = x;
}
- (void) addSub:(NSString*)s pos:(int)pos len:(id)len{
	[self.b objectAtIndex:self.b.length] = [s substringWithRange:substr:pos len:len];
}
- (void) addChar:(int)c{
	[self.b objectAtIndex:self.b.length] = [NSString fromCharCode:c];
}
- (NSString*) toString{
	return [self.b join:@""];
}

@end
