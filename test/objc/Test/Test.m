#import "Test.h"

@implementation Test


- (void) Test{
}


+ (UIApplicationMain*) main{
	return [[UIApplicationMain alloc] init]Test;
}


- (void) printHello{
	NSLog(@"testing __objc__");
Log generateFieldAccess1 .trace[@"Hello from Haxe Objective-C" 	{ 	fileName : @"Test.hx", 	lineNumber : 87, 	className : @"Test", 	methodName : @"printHello"	}];
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
		while695(_g < aa generateFieldAccess1 .length) {
			int i = [aa objectAtIndex: _g];
++_g;
a generateFieldAccess1 .push[Std generateFieldAccess1 .string[i]];
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
	if(a generateFieldAccess1 .length > 3) f = 3	
	else f = a generateFieldAccess1 .length;
	int x = [[Test alloc] init] generateFieldAccess1 .add[1 1];
	UIWebView *webView = [[UIWebView alloc] init];
	MKMapView *map = [[MKMapView alloc] init];
}


- (BOOL) applicationHandleOpenURL:(UIApplication*)application handleOpenURL:(NSURL*)handleOpenURL{
	return YES;
}


- (void) applicationWillResignActive:(UIApplication*)application{
}


- (void) applicationDidBecomeActive:(UIApplication*)application{
}


- (BOOL) applicationDidFinishLaunchingWithOptions:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)didFinishLaunchingWithOptions{
Log generateFieldAccess1 .trace[@"Application launched" 	{ 	fileName : @"Test.hx", 	lineNumber : 30, 	className : @"Test", 	methodName : @"applicationDidFinishLaunchingWithOptions"	}];
	return YES;
}



@synthesize interfaceVar2 = _interfaceVar2;
@synthesize interfaceVar1 = _interfaceVar1;
@synthesize window = _window;

@end
