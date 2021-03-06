//
//  CallStack
//  Tests
//
//  Source generated by Haxe Objective-C target
//

typedef enum{
	CFunction,
	Module,
	FilePos,
	Method,
	Lambda
} StackItem;

#import <Foundation/Foundation.h>

#import "../Array.h"
#import "../haxe/CallStack.h"
#import "../String.h"
#import "../StringBuf.h"
#import "../Std.h"
#import "../haxe/StackItem.h"

@interface CallStack : HXObject

+ (NSMutableArray*) callStack;
+ (NSMutableArray*) exceptionStack;
+ (NSMutableString*) toString:(NSMutableArray*)stack;
+ (void) itemToString:(StringBuf*)b s:(CallStack*)s;
+ (NSMutableArray*) makeStack:(NSMutableArray*)s;

@end

