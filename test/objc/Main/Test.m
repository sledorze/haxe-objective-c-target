#import "Test.h"

@implementation Test


- (void) init{
}


@synthesize window;

@synthesize interfaceVar1;

@synthesize interfaceVar2;


- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)didFinishLaunchingWithOptions{
	[GEN_M_CALL>Field>Log trace:2Const>ObjectDecl>>>TEnum>>0Void];
	[GEN_M_CALL>Field>self lotsOfArguments:4Const>Const>Const>Const>>>TEnum>>0Void];
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
	Array *a = [[Array alloc] init];
	Array *aa = [[NSMutableArray alloc] initWithObjects: 1, 2, 3, 4, 5, nil];
	int b = 5;
	float c = 5.0;
	NSString *d = @"xyz";
	BOOL e = YES;
	int f;
	int g = (int*);
	int xy = a.length;
	[GEN_M_CALL>Field>a push:1Const>TInst];
{
		int _g = 0;
		while695 (_g < aa.length) {
			int i = [aa objectAtIndex:_g];
++_g;
			[GEN_M_CALL>Field>a push:1Call>TInst];
		}
	}
	switch (e){
		case YES:{
nil		}
		break;		
		case NO:{
nil		}
		break;		
	}
	if (a.length > 3) f = 3	
	else f = a.length;
f = ( (a.length > 3)?3:a.length);
	int x = 	[GEN_M_CALL>Field>[[Test alloc] init] add:2Const>Const>TInst];
	UIWebView *webView = [[UIWebView alloc] init];
	MKMapView *map = [[MKMapView alloc] init];
map.frame = CGRectMake (10,10,200,200);
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


- (void) lotsOfArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4{
}


- (void) printHello{
	NSLog(@"testing __objc__");
	[GEN_M_CALL>Field>Log trace:2Const>ObjectDecl>>>TEnum>>0Void];
}



@end
