

#import "String.h"
#import "Array.h"
#import "haxe/Log.h"
#import "Int.h"

@interface Tests<Interface2, Interface1>



@property (nonatomic) int interfaceVar1;
@property (nonatomic) float interfaceVar2;
@property (nonatomic, getter=getWidth, setter=setWidth) int width;
- (void) tests;
- (int) getWidth;
- (int) setWidth:(int)v;
- (int) add:(int)a b:(int)b;
- (int) minus:(int)a b:(int)b;
- (void) callLotsOfArguments:(int)arg1 _:(int)_ _1:(int)_1 arg4:(int)arg4;
- (void) printHello;

@end
