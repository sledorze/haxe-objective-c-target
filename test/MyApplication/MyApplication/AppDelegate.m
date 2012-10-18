//
//  AppDelegate.m
//  MyApplication
//
//  Created by Baluta Cristian on 12/10/2012.
//  Copyright (c) 2012 Baluta Cristian. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
	
	
	NSLog(@"Creating the app. There's nothing to display at this step");
	
	// CODE GENERATED IN THE main METHOD
	
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	float screenWidth = screenRect.size.width;
	CGFloat screenHeight = screenRect.size.height;
	
	UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
	v.autoresizesSubviews = YES;
	v.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
	
	self.viewController = [[UIViewController alloc] init];
	self.viewController.view = v;
	
	UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
	l.textColor = [UIColor redColor];
	l.textAlignment = NSTextAlignmentCenter;
	l.font = [UIFont boldSystemFontOfSize:20];
	l.text = @"Hello world!";
	[v addSubview:l];
	
	self.window.rootViewController = self.viewController;
	
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
