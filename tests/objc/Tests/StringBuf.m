#import "StringBuf.h"

@implementation StringBuf

@synthesize b;
- (void) add:(id)x{
	self.b += [Std string:x];
}
- (void) addChar:(int)c{
	self.b += [NSMutableString fromCharCode:c];
}
- (void) addSub:(NSMutableString*)s pos:(int)pos len:(id)len{
	self.b += [s substringWithRange:substr:pos len:len];
}
- (NSMutableString*) toString{
	return self.b;
}
- (id) new{
	self = [super init];
	self.b = @"";
	return self;
}

@end
