#import "StringBuf.h"

@implementation StringBuf

@synthesize b;
- (void) add:(id)x{
	[self.b objectAtIndex:self.b.length] = x;
}
- (void) addSub:(NSMutableString*)s pos:(int)pos len:(id)len{
	[self.b objectAtIndex:self.b.length] = [s substringWithRange:substr:pos len:len];
}
- (void) addChar:(int)c{
	[self.b objectAtIndex:self.b.length] = [NSMutableString fromCharCode:c];
}
- (NSMutableString*) toString{
	return [self.b join:@""];
}
- (id) new{
	self = [super init];
	self.b = [[NSMutabeArray alloc] new][];
	return self;
}

@end
