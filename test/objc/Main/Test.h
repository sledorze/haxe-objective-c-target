
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "Test.h"
#import "haxe/Log.h"
#import "Std.h"
#import "Main.h"

@interface Test : UIResponder <UIApplicationDelegate>


- (void) printHello;

- (int) minus:(int)a b:(int)b;

- (int) add:(int)a b:(int)b;

- (int) setWidth:(int)v;

- (int) getWidth;

- (void) tests;

- (BOOL) application:(UIApplication*)application handleOpenURL:(NSURL*)handleOpenURL;

- (void) applicationWillResignActive:(UIApplication*)application;

- (void) applicationDidBecomeActive:(UIApplication*)application;

- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)didFinishLaunchingWithOptions;

@property (nonatomic, strong, getter=getWidth, setter=setWidth) int width;
@property (nonatomic, strong) float interfaceVar2;
@property (nonatomic, strong) int interfaceVar1;
@property (nonatomic, strong) UIWindow *window;

@end
