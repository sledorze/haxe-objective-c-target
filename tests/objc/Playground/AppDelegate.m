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
//	NSLog(@"%@", [Std string:self]);
//	NSLog(@"%i", [Std parseInt:(NSMutableString*)@"5425345.3"]);
//	NSLog(@"%2f", [Std parseFloat:(NSMutableString*)@"5425345.3"]);
//	NSLog(@"%i", [Std int:54.53]);
//	
//	NSDate *date = [NSDate now];
//	NSLog(@"%@", date);
//	NSDate *date2 = [NSDate fromTime:1000000000];
//	NSLog(@"%@", date2);
//	NSDate *date3 = [NSDate fromString:(NSMutableString*)@"2013-02-18 15:34:50"];
//	NSLog(@"%@", date3);
//	NSLog(@"%@", [date toString]);
	
	//[self callThis:@selector(func)];
	//[self callBlock:^(){ NSLog(@"Block was called"); }];
	
	// redefine a method
	Tests2 *test2 = [[Tests2 alloc] init];
	test2.block1 = ^(){ [self func]; };
	[test2 methodInTests2];
	
    return YES;
}

- (void) callThis:(SEL)sel {
	[self performSelector:sel];
}
//- (void) callBlock:(void)(^sel) {
//	//[self performSelector:sel];
//	sel();
//}
- (void) func {
	NSLog(@"func was called");
}



static int length__;
- (int) length{
	return length__;
}
- (void) setLength:(int)val{
	length__ = val;
}


@end



@implementation Tests2

@synthesize d1;
@synthesize block1;
- (void) methodInTests2{
	NSLog(@"methodInTests2 is calling block1 : %@", block1);
	block1();
}
- (void) redefineThisMethod{
}
- (id) init{
	self = [super init];
	self.d1 = 34;
	
	//NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:self.d1, self.d1, [NSNumber numberWithInt:50], nil];
	return self;
}

@end

