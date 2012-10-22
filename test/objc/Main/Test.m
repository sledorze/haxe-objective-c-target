#import "Test.h"

@implementation Test


- (void) Test{
}


- (void) printHello{
	NSLog(@"testing __objc__");
	[Log trace:@"" andPos:@""];;
	[Log trace:@"Hello from Haxe Objective-C" otherArgName:	{	fileName:@"Test.hx" ,	lineNumber:83 ,	className:@"Test" ,	methodName:@"printHello"	}];
}


- (int) minus:(int)a b:(int)b{
	return a - b;
}


- (int) add:(int)a b:(int)b{
	return a + b;
}


- (int) setWidth:(int)v{
	return 0;
}


- (int) getWidth{
	return 0;
}


- (void) tests{
	NSMutableArray *a = [[Array alloc] init];
	NSMutableArray *aa = [[NSMutableArray alloc] initWithObjects: 1, 2, 3, 4, 5, nil];
	int xy = a.length;
	[a push:@"6"];
}


- (BOOL) application:(UIApplication*)application handleOpenURL:(NSURL*)handleOpenURL{
	return YES;
}


- (void) applicationWillResignActive:(UIApplication*)application{
}


- (void) applicationDidBecomeActive:(UIApplication*)application{
}


- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)didFinishLaunchingWithOptions{
	[Log trace:@"Application launched" otherArgName:	{	fileName:@"Test.hx" ,	lineNumber:23 ,	className:@"Test" ,	methodName:@"applicationDidFinishLaunchingWithOptions"	}];
	return YES;
}



@synthesize interfaceVar2;
@synthesize interfaceVar1;
@synthesize window;

@end
