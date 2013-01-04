//
//  AppDelegate.m
//  Playground
//
//  Created by Baluta Cristian on 03/01/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//

#import "AppDelegate.h"
#import "Date.h"
#import "Std.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	
//	NSLog(@"%i", self.length);
//	self.length = 5;
//	NSLog(@"%i", self.length);
//	self.length += 5;
//	NSLog(@"%i", self.length);
	
	NSLog(@"%i", [Std random:100]);
	NSLog(@"%i", [Std random:100]);
	NSLog(@"%@", [Std string:self]);
	NSLog(@"%i", [Std parseInt:@"5425345.3"]);
	NSLog(@"%2f", [Std parseFloat:@"5425345.3"]);
	NSLog(@"%i", [Std int:54.53]);
	
	NSDate *date = [NSDate now];
	NSLog(@"%@", date);
	NSDate *date2 = [NSDate fromTime:1000000000];
	NSLog(@"%@", date2);
	NSDate *date3 = [NSDate fromString:@"2013-02-18 15:34:50"];
	NSLog(@"%@", date3);
	NSLog(@"%@", [date toString]);
	NSLog(@"%i", [date getHours]);
	NSLog(@"%i", [date getMinutes]);
	
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
