#import "Test.h"

@implementation Test


- (void) Test{
}


- (void) printHello{
	NSLog(@"testing __objc__");
[Log trace [@"Hello from Haxe Objective-C" 	{ 	fileName : @"Test.hx", 	lineNumber : 80, 	className : @"Test", 	methodName : @"printHello"	}];
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
	int b = 5;
	float c = 5.0;
	NSString *d = @"xyz";
	BOOL e = YES;
	int f;
	int g = (int*);
{
		int _g = 0;
		while695(_g < [aa length ) {
			int i = [aa objectAtIndex: _g];
++_g;
[a push [[Std string [i]];
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
	if([a length  > 3) f = 3	
	else f = [a length ;
	int x = [[[Test alloc] init] add [1 1];
	UIWebView *webView = [[UIWebView alloc] init];
	MKMapView *map = [[MKMapView alloc] init];
}


- (BOOL) application:(UIApplication*)application handleOpenURL:(NSURL*)handleOpenURL{
	return YES;
}


- (void) applicationWillResignActive:(UIApplication*)application{
}


- (void) applicationDidBecomeActive:(UIApplication*)application{
}


- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)didFinishLaunchingWithOptions{
[Log trace [@"Application launched" 	{ 	fileName : @"Test.hx", 	lineNumber : 23, 	className : @"Test", 	methodName : @"applicationDidFinishLaunchingWithOptions"	}];
	return YES;
}



@synthesize interfaceVar2 = _interfaceVar2;
@synthesize interfaceVar1 = _interfaceVar1;
@synthesize window = _window;

@end
