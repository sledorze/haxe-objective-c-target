
#import <MapKit/MapKit.h>

#import "Array.h"
#import "Tests.h"
#import "Lib.h"
#import "Log.h"
#import "Date.h"
#import "DateTools.h"
#import "Hash.h"
#import "IntHash.h"
#import "Reflect.h"
#import "StringBuf.h"
#import "StringTools.h"

@interface Tests : NSObject<Interface2, Interface1>

-F-
+ (NSMutableString*) staticVar1:(NSMutableString*)val;
-F-
+ (int) staticVar2:(int)val;
-F-
+ (int) staticVar3:(int)val;
-F-

-F-
@property (nonatomic) int interfaceVar1;
-F-
@property (nonatomic) float interfaceVar2;
-F-
@property (nonatomic, getter=getWidth, setter=setWidth) int width;
-F-
@property (nonatomic) int d1;
-F-
@property (nonatomic) float d2;
-F-
@property (nonatomic, strong) NSMutableString *s;
-F-
- (void) testVariables;
-F-
- (void) testingFor;
-F-
- (void) testWhile;
-F-
- (void) testTry;
-F-
- (void) testSwitch;
-F-
- (void) testArray;
-F-
- (void) testDate;
-F-
- (void) testEnum;
-F-
- (void) testEReg;
-F-
- (void) testHash;
-F-
- (void) testLambda;
-F-
- (void) testList;
-F-
- (void) testMath;
-F-
- (void) testReflect;
-F-
- (void) testStd;
-F-
- (void) testString;
-F-
- (void) testSys;
-F-
- (void) testType;
-F-
- (void) testXml;
-F-
- (void) testFrameworksImport;
-F-
- (int) getWidth;
-F-
- (int) setWidth:(int)v;
-F-
- (int) add:(int)a b:(int)b;
-F-
- (int) minus:(int)a b:(int)b;
-F-
- (void) callLotsOfArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4;
-F-
- (void) optionalArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(id)arg4;
-F-
- (void) optionalArguments1:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4;
-F-
- (void) optionalArguments2:(int)arg1 arg2:(id)arg2 arg3:(id)arg3 arg4:(int)arg4;
-F-
- (void) optionalArguments3:(int)arg1 arg2:(int)arg2 arg3:(id)arg3 arg4:(int)arg4;
-F-
- (void) init;
-F-
- (void) printHello;
-F-
- (id) new;

@end
