#import "Log.h"

@implementation Log

-F-
+ (void) trace:(id)v infos:(id)infos "-E-Block>" {
	 "-E-Call>" NSLog (@"%@:%@: %@", [infos objectForKey:@"filename"], [infos objectForKey:@"lineNumber"], v);
}
-F-
+ (void) clear "-E-Block>" {
}

@end
