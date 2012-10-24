#import "Test.h"

@implementation Test

-F-
- (void) init-E-Block>{
}
-F-
@synthesize window;-F-
@synthesize interfaceVar1;-F-
@synthesize interfaceVar2;-F-
-F-
- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)didFinishLaunchingWithOptions-E-Block>{
-E-Call>	[-CALL-Field>-V-Field>-E-Field>-V-TypeExpr>-E-TypeExpr>Log trace:2Const>ObjectDecl>>>TEnum>>0Void];
-E-Call>	[-CALL-Field>-V-Field>-E-Field>-V-Const>-E-Const>self lotsOfArguments:4Const>Const>Const>Const>>>TEnum>>0Void];
-E-Return>	return -V-Const>-E-Const>YES;
}
-F-
- (void) applicationDidBecomeActive:(UIApplication*)application-E-Block>{
}
-F-
- (void) applicationWillResignActive:(UIApplication*)application-E-Block>{
}
-F-
- (BOOL) application:(UIApplication*)application handleOpenURL:(NSURL*)handleOpenURL-E-Block>{
-E-Return>	return -V-Const>-E-Const>YES;
}
-F-
- (void) tests-E-Block>{
-E-Vars>	Array *a = -V-New>-E-New>[[Array alloc] init];
-E-Vars>	Array *aa = -V-ArrayDecl>-E-ArrayDecl>[[NSMutableArray alloc] initWithObjects: -V-Const>-E-Const>1, -V-Const>-E-Const>2, -V-Const>-E-Const>3, -V-Const>-E-Const>4, -V-Const>-E-Const>5, nil];
-E-Vars>	int b = -V-Const>-E-Const>5;
-E-Vars>	float c = -V-Const>-E-Const>5.0;
-E-Vars>	NSString *d = -V-Const>-E-Const>@"xyz";
-E-Vars>	BOOL e = -V-Const>-E-Const>YES;
-E-Vars>	int f;
-E-Vars>	int g = -V-Cast>(int*);
-E-Vars>	int xy = -V-Field>-E-Field>-V-Local>-E-Local>a.length;
-E-Call>	[-CALL-Field>-V-Field>-E-Field>-V-Local>-E-Local>a push:1Const>TInst];
-E-Block>{
-E-Vars>		int _g = -V-Const>-E-Const>0;
-E-While>		while695-V-Parenthesis>-E-Parenthesis> (-V-Binop>-E-Binop>-V-Local>-E-Local>_g < -V-Field>-E-Field>-V-Local>-E-Local>aa.length) -E-Block>{
-E-Vars>			int i = -V-Array>-E-Array>[-V-Local>-E-Local>aa objectAtIndex:-V-Local>-E-Local>_g];
-E-Unop>++-V-Local>-E-Local>_g;
-E-Call>			[-CALL-Field>-V-Field>-E-Field>-V-Local>-E-Local>a push:1Call>TInst];
		}
	}
-E-Switch>	switch-V-Parenthesis>-E-Parenthesis> (-V-Local>-E-Local>e){
		case -V-Const>-E-Const>YES:{
-E-Const>nil		}
		break;		
		case -V-Const>-E-Const>NO:{
-E-Const>nil		}
		break;		
	}
-E-If>	if-V-Parenthesis>-E-Parenthesis> (-V-Binop>-E-Binop>-V-Field>-E-Field>-V-Local>-E-Local>a.length > -V-Const>-E-Const>3) -E-Binop>-V-Local>-E-Local>f = -V-Const>-E-Const>3	
	else -E-Binop>-V-Local>-E-Local>f = -V-Field>-E-Field>-V-Local>-E-Local>a.length;
-E-Binop>-V-Local>-E-Local>f = -V-If>(-V-Parenthesis>-E-Parenthesis> (-V-Binop>-E-Binop>-V-Field>-E-Field>-V-Local>-E-Local>a.length > -V-Const>-E-Const>3)?-V-Const>-E-Const>3:-V-Field>-E-Field>-V-Local>-E-Local>a.length);
-E-Vars>	int x = -V-Call>-E-Call>	[-CALL-Field>-V-Field>-E-Field>-V-New>-E-New>[[Test alloc] init] add:2Const>Const>TInst];
-E-Vars>	UIWebView *webView = -V-New>-E-New>[[UIWebView alloc] init];
-E-Vars>	MKMapView *map = -V-New>-E-New>[[MKMapView alloc] init];
-E-Binop>-V-Field>-E-Field>-V-Local>-E-Local>map.frame = -V-New>-E-New>CGRectMake (-V-Const>-E-Const>10,-V-Const>-E-Const>10,-V-Const>-E-Const>200,-V-Const>-E-Const>200);
}
-F-
- (int) getWidth-E-Block>{
-E-Return>	return -V-Const>-E-Const>0;
}
-F-
- (int) setWidth:(int)v-E-Block>{
-E-Return>	return -V-Const>-E-Const>0;
}
-F-
- (int) add:(int)a b:(int)b-E-Block>{
-E-Return>	return -V-Binop>-E-Binop>-V-Local>-E-Local>a + -V-Local>-E-Local>b;
}
-F-
- (int) minus:(int)a b:(int)b-E-Block>{
-E-Return>	return -V-Binop>-E-Binop>-V-Local>-E-Local>a - -V-Local>-E-Local>b;
}
-F-
- (void) lotsOfArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4-E-Block>{
}
-F-
- (void) printHello-E-Block>{
-E-Call>	NSLog(@"testing __objc__");
-E-Call>	[-CALL-Field>-V-Field>-E-Field>-V-TypeExpr>-E-TypeExpr>Log trace:2Const>ObjectDecl>>>TEnum>>0Void];
}


@end
