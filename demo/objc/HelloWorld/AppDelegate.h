
#import <UIKit/UIKit.h>

#import "CustomMapView.h"
#import "objc/foundation/NSDictionary.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UILabel *label;
- (BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)didFinishLaunchingWithOptions;
- (void) applicationDidBecomeActive:(UIApplication*)application;
- (void) applicationWillResignActive:(UIApplication*)application;

@end
