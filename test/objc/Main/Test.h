
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "Array.h"
#import "Test.h"
#import "haxe/Log.h"
#import "Std.h"
#import "Main.h"

@interface Test : UIResponder <UIApplicationDelegate>

-F-
@property (nonatomic, strong) UIWindow *window;-F-
@property (nonatomic) int interfaceVar1;-F-
@property (nonatomic) float interfaceVar2;-F-
@property (nonatomic, getter=getWidth, setter=setWidth) int width;-F-
- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)didFinishLaunchingWithOptions;-F-
- (void) applicationDidBecomeActive:(UIApplication*)application;-F-
- (void) applicationWillResignActive:(UIApplication*)application;-F-
- (BOOL) application:(UIApplication*)application handleOpenURL:(NSURL*)handleOpenURL;-F-
- (void) tests;-F-
- (int) getWidth;-F-
- (int) setWidth:(int)v;-F-
- (int) add:(int)a b:(int)b;-F-
- (int) minus:(int)a b:(int)b;-F-
- (void) lotsOfArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4;-F-
- (void) printHello;

@end
