//
//  Tests
//  Tests
//
//  Source generated by Haxe Objective-C target
//

typedef enum{
	Red,
	Green,
	Blue,
	Grey,
	Rgb,
	Alpha
} Color;

#import <Foundation/Foundation.h>

#import "String.h"
#import "Array.h"
#import "Tests.h"
#import "Lib.h"
#import "Log.h"
#import "Date.h"
#import "DateTools.h"
#import "TestsEnumExtern.h"
#import "Color2.h"
#import "EReg.h"
#import "Hash.h"
#import "IntHash.h"
#import "Lambda.h"
#import "List.h"
#import "Std.h"
#import "FastList.h"
#import "Reflect.h"
#import "StringBuf.h"
#import "StringTools.h"
#import "Sys.h"
#import "Output.h"
#import "Input.h"
#import "Class.h"
#import "Type.h"
#import "Tests2.h"
#import "TestC.h"
#import "TestHaxePack.h"

@interface Tests : NSObject<Interface2, Interface1>

+ (NSMutableString*) staticVar1:(NSMutableString*)val;
+ (int) staticVar2:(int)val;
+ (int) staticVar3:(int)val;

@property (nonatomic) int interfaceVar1;
@property (nonatomic) float interfaceVar2;
@property (nonatomic, getter=getWidth, setter=setWidth) int width;
@property (nonatomic) int d1;
@property (nonatomic) float d2;
@property (nonatomic, strong) NSMutableString *s;
- (void) testVariables;
- (void) testingFor;
- (void) testWhile;
- (void) testTry;
- (void) testSwitch;
- (void) testArray;
- (void) testDate;
- (int) enumToInt:(Tests*)c;
- (void) testEnum:(id)v;
- (void) testEReg;
- (void) testHash;
- (void) testLambda;
- (void) testList;
- (void) testReflect;
- (void) testStd;
- (void) testString;
- (void) testSys;
- (void) testType;
- (void) testXml;
- (void) foo;
- (void) testOverload;
- (void) testFrameworksImport;
- (int) getWidth;
- (int) setWidth:(int)v;
- (int) add:(int)a b:(int)b;
- (int) minus:(int)a b:(int)b;
- (void) callLotsOfArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4;
- (void) optionalArguments:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4;
- (void) optionalArguments1:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4;
- (void) optionalArguments2:(int)arg1 arg2:(int)arg2 arg3:(int)arg3 arg4:(int)arg4;
- (void) optionalArguments3:(int)arg1 arg2:(int)arg2 arg3:(BOOL)arg3 arg4:(BOOL)arg4;
- (void) init;
- (void) printHello;
- (void) functionToRedefine;
- (void) functionToRedefine2:(int)param1 param2:(NSMutableString*)param2;
- (id) init;

@end



#import "Log.h"
#import "String.h"
#import "Array.h"

@interface Tests2 : NSObject

@property (nonatomic) int d1;
- (void) methodInTests2;
// Defining a dynamic method
- (void) functionToRedefine;
@property (nonatomic,copy) void(^property_functionToRedefine)();
// Defining a dynamic method
- (void) functionToRedefine2:(int)param1 param2:(NSMutableString*)param2;
@property (nonatomic,copy) void(^property_functionToRedefine2)(int, NSMutableString*);
- (id) init;

@end

typedef enum{
	Red2,
	Green2,
	Blue2
} Color2;
