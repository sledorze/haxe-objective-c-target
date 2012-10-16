
#import <UIKit/UIKit.h>


@interface Test : UIWebView <Interface2, TestInterface>


+ (void) main;

- (void) printHello;

- (int) minusa:(int)a b:(int)b;

- (int) adda:(int)a b:(int)b;

- (int) setWidthv:(int)v;

- (int) getWidth;

@property (nonatomic, strong, getter=getWidth, setter=setWidth) int width;
@property (nonatomic, strong) float interfaceVar2;
@property (nonatomic, strong) int interfaceVar1;

@end
