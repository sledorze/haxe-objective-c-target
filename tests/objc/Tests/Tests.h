
#import <MapKit/MapKit.h>

#import "Array.h"
#import "Float.h"
#import "String.h"
#import "Int.h"
#import "Log.h"

@interface Tests<Interface2, Interface1>


@property (nonatomic) int interfaceVar1;
@property (nonatomic) float interfaceVar2;
@property (nonatomic, getter=getWidth, setter=setWidth) int width;
- (void) tests;
- (void) testingFor;
- (void) testingWhile;
- (void) testTry;
- (void) testFrameworksImport;
- (int) getWidth;
- (int) setWidth:(int)v;
- (int) add:(int)a b:(int)b;
- (int) minus:(int)a b:(int)b;
- (void) callLotsOfArguments:(int)arg1 _:(int)_ arg3:(int)arg3 arg4:(int)arg4;
- (void) printHello;

@end
