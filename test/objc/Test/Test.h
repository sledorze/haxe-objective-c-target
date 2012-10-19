
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "Test.h"
#import "haxe/Log.h"
#import "Std.h"

@interface Test : UIResponder <UIApplicationDelegate>


+ (UIApplicationMain*) main;

- (void) printHello;

- (int) minus:(int)a b:(int)b;

- (int) add:(int)a b:(int)b;

- (int) setWidth:(int)v;

- (int) getWidth;

- (void) tests;

- (BOOL) applicationHandleOpenURL:(UIApplication*)application handleOpenURL:(NSURL*)handleOpenURL;

- (void) applicationWillResignActive:(UIApplication*)application;

- (void) applicationDidBecomeActive:(UIApplication*)application;

- (BOOL) applicationDidFinishLaunchingWithOptions:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)didFinishLaunchingWithOptions;

@property (nonatomic, strong, getter=getWidth, setter=setWidth) int width;
@property (nonatomic, strong) float interfaceVar2;
@property (nonatomic, strong) int interfaceVar1;
@property (nonatomic, strong) UIWindow *window;

@end
