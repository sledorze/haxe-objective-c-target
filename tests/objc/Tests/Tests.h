
#import <MapKit/MapKit.h>

#import "Array.h"
#import "Tests.h"
#import "Lib.h"
#import "Log.h"
#import "Date.h"
#import "DateTools.h"

@interface Tests : NSObject<Interface2, Interface1>

+ (NSMutableString*) staticVar1:(NSMutableString*)val;
+ (int) staticVar2:(int)val;
+ (int) staticVar3:(int)val;

@property (nonatomic) int interfaceVar1;
@property (nonatomic) float interfaceVar2;
@property (nonatomic, getter=getWidth, setter=setWidth) int width;
- (void) tests;
- (void) testingFor;
- (void) testingWhile;
- (void) testTry;
- (void) testSwitch;
- (void) testDate;
- (void) testString;
- (void) testFrameworksImport;
- (int) getWidth;
- (int) setWidth:(int)v;
- (int) add:(int)a b:(int)b;
- (int) minus:(int)a b:(int)b;
- (void) callLotsOfArguments:(int)arg1 t:(int)t t1:(int)t1 arg4:(int)arg4;
- (void) printHello;
- (id) new;

@end
