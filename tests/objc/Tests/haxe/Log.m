#import "haxe/Log.h"

@implementation Log


+ (void) trace:(id)v infos:(id)infos{
	NSLog (@"%@:%@: %@", [infos objectForKey:@"filename"], [infos objectForKey:@"lineNumber"], v);
}
+ (void) clear{
}

@end
