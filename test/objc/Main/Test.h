
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "Array.h"
#import "Test.h"
#import "haxe/Log.h"
#import "Std.h"
#import "Main.h"

@interface Test : UIResponder <UIApplicationDelegate>


@property (nonatomic, strong) UIWindow *window;
@property (nonatomic) int interfaceVar1;
@property (nonatomic) float interfaceVar2;
@property (nonatomic, getter=getWidth, setter=setWidth) int width;
- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)didFinishLaunchingWithOptions;
- (void) applicationDidBecomeActive:(UIApplication*)application;
- (void) applicationWillResignActive:(UIApplication*)application;
- (BOOL) application:(UIApplication*)application handleOpenURL:(NSURL*)handleOpenURL;
- (void) tests;
- (int) getWidth;
- (int) setWidth:(int)v;
- (int) add:(int)a b:(int)b;
- (int) minus:(int)a b:(int)b;
- (void) lotsOfArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4;
- (void) printHello;

@end
