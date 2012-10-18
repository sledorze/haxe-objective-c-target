
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "TestInterface.h"
#import "Test.h"
#import "haxe/Log.h"
#import "Std.h"
#import "Interface2.h"

@interface Test : UIWebView <Interface2, TestInterface>


+ (void) main;

- (void) printHello;

- (int) minus:(int)a b:(int)b;

- (int) add:(int)a b:(int)b;

- (int) setWidth:(int)v;

- (int) getWidth;

@property (nonatomic, strong, getter=getWidth, setter=setWidth) int width;
@property (nonatomic, strong) float interfaceVar2;
@property (nonatomic, strong) int interfaceVar1;

@end
