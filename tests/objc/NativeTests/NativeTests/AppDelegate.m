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
	
	
	[Log trace:@"Hello from Haxe Objective-C" infos:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Tests.hx",@"457",@"Tests",@"printHello",nil] forKeys:[NSArray arrayWithObjects:@"fileName",@"lineNumber",@"className",@"methodName",nil]]];
	[Lib println:@"testing print"];
	
    return YES;
}

@end
