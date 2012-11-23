#import "IntHash.h"

@implementation IntHash

- (void) set:(int)key value:(id)value{
	[self.setObject-non-];
}
- (id) get:(int)key{
	return [self.objectForKey-non-];
}
- (BOOL) exists:(int)key{
	return [self.objectForKey-non-] != nil;
}
- (BOOL) remove:(int)key{
	return [self.removeObjectForKey-non-];
}
- (id) keys{
	
	NSMutabeArray *a = [self.allKeys];
	return [a iterator];
}
- (id) iterator{
	
	NSMutabeArray *a = [self.allValues];
	return [a iterator];
}
- (NSMutableString*) toString{
	return [self.description];
}
- (id) new{
	self = [super init];
	return self;
}

@end
