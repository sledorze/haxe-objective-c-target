//
//  AppDelegate.m
//  Playground
//
//  Created by Baluta Cristian on 03/01/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	
	NSLog(@"%i", self.length);
	self.length = 5;
	NSLog(@"%i", self.length);
	self.length += 5;
	NSLog(@"%i", self.length);
	
    return YES;
}

static int length__;
- (int) length{
	return length__;
}
- (void) setLength:(int)val{
	length__ = val;
}


@end
