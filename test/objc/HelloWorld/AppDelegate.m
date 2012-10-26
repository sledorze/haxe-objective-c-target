#import "AppDelegate.h"

@implementation AppDelegate


@synthesize window;
@synthesize viewController;
@synthesize view;
@synthesize label;
- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)didFinishLaunchingWithOptions{
	self.window = [[UIWindow alloc] init];
	UIScreen *screen = 	[UIScreen mainScreen];
	self.window.frame = screen.bounds;
	self.view = [[UIView alloc] init];
	self.view.frame = CGRectMake (0,0,self.window.frame.size.width,self.window.frame.size.height);
	self.view.autoresizesSubviews = YES;
	view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
	self.view.backgroundColor = 	[UIColor darkGrayColor];
	self.label = [[UILabel alloc] init];
	self.label.frame = CGRectMake (0,350,self.view.frame.size.width,50);
	self.label.textColor = 	[UIColor yellowColor];
	self.label.backgroundColor = 	[UIColor clearColor];
	label.textAlignment = NSTextAlignmentCenter;
	self.label.font = 	[UIFont boldSystemFontOfSize:30];
	self.label.text = @"Hello world!";
	[self.view addSubview:self.label];
	CustomMapView *map = [[CustomMapView alloc] init];
	map.frame = CGRectMake (10,10,300,300);
	[map locateLondon];
	[map locate:50.8 long:50.8 zoom:50.8];
	[self.view addSubview:map];
	self.viewController = [[UIViewController alloc] init];
	self.viewController.view = self.view;
	self.window.rootViewController = self.viewController;
	[self.window makeKeyAndVisible];
	int x = 3;
	return YES;
}

- (void) applicationDidBecomeActive:(UIApplication*)application{
}

- (void) applicationWillResignActive:(UIApplication*)application{
}


@end
