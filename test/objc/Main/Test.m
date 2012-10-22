#import "Test.h"

@implementation Test


- (void) init{
}


@synthesize window;

@synthesize interfaceVar1;

@synthesize interfaceVar2;


- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)didFinishLaunchingWithOptions{
	[Log trace:@"Application launched" otherArgName:	{	fileName:@"Test.hx" ,	lineNumber:23 ,	className:@"Test" ,	methodName:@"applicationDidFinishLaunchingWithOptions"	}];
	return YES;
}


- (void) applicationDidBecomeActive:(UIApplication*)application{
}


- (void) applicationWillResignActive:(UIApplication*)application{
}


- (BOOL) application:(UIApplication*)application handleOpenURL:(NSURL*)handleOpenURL{
	return YES;
}


- (void) tests{
	NSMutableArray *a = [[Array alloc] init];
	NSMutableArray *aa = [[NSMutableArray alloc] initWithObjects: 1, 2, 3, 4, 5, nil];
	int b = 5;
	float c = 5.0;
	NSString *d = @"xyz";
	BOOL e = YES;
	int f;
	int g = (int*);
	int xy = a.length;
	[a push:@"6"];
{
		int _g = 0;
		while695(_g < aa.length) {
			int i = [aa objectAtIndex:_g];
++_g;
			[a push:			[Std string:i]];
		}
	}
	switch(e) {	
	case YES:{
nil	}
	break;	
	case NO:{
nil	}
	break;	
};
	if(a.length > 3) f = 3	
	else f = a.length;
f = ((a.length > 3)?3:a.length);
	int x = 	[[[Test alloc] init] add:1 otherArgName:1];
	UIWebView *webView = [[UIWebView alloc] init];
	MKMapView *map = [[MKMapView alloc] init];
}


- (int) getWidth{
	return 0;
}


- (int) setWidth:(int)v{
	return 0;
}


- (int) add:(int)a b:(int)b{
	return a + b;
}


- (int) minus:(int)a b:(int)b{
	return a - b;
}


- (void) printHello{
	NSLog(@"testing __objc__");
	[Log trace:@"" andPos:@""];;
	[Log trace:@"Hello from Haxe Objective-C" otherArgName:	{	fileName:@"Test.hx" ,	lineNumber:84 ,	className:@"Test" ,	methodName:@"printHello"	}];
}



@end
