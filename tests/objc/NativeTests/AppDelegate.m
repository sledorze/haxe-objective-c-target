//
//  AppDelegate.m
//  NativeTests
//
//  Created by Baluta Cristian on 10/12/2012.
//  Copyright (c) 2012 Baluta Cristian. All rights reserved.
//

#import "AppDelegate.h"
#import "Log.h"
#import "Lib.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	
	
	UIView *v = [[UIView alloc] init];
	[Log trace:@"Hello from Haxe Objective-C" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"457",@"Tests",@"printHello",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[Log trace:v infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"457",@"Tests",@"printHello",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[Lib println:@"testing print"];
	[Lib println:v];
	
    return YES;
}
- (void) testMath{
	float pi = M_PI;
	float max = -DBL_MAX;
	float min = DBL_MAX;
	float nan = NaN;
	float x = sqrtf(5);
	x = absf(5);
	x = fmaxf(5, 45555);
	x = fminf(5, 45555);
	x = sinf(5);
	x = cosf(5);
	x = atan2f(5, 3);
	x = tanf(5);
	x = expf(5);
	x = logf(5);
	x = sqrtf(5);
	int xr = roundf(5);
	xr = floorf(5);
	xr = ceilf(5);
	x = atanf(5);
	x = asinf(5);
	x = acosf(5);
	x = powf(5, 4);
	x = rand() * 5;
	BOOL b = isfinite(45454);
	b = isnan(45454);
	float j = x + xr;
	j += x;
	float k = ( (b) ? -x : x);
}

@end
