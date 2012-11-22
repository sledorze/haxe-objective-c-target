

#import "String.h"
#import "Int.h"
#import "StringTools.h"

@interface StringTools : NSObject

+ (NSMutableString*) urlEncode:(NSMutableString*)s;
+ (NSMutableString*) urlDecode:(NSMutableString*)s;
+ (NSMutableString*) htmlEscape:(NSMutableString*)s;
+ (NSMutableString*) htmlUnescape:(NSMutableString*)s;
+ (BOOL) startsWith:(NSMutableString*)s start:(NSMutableString*)start;
+ (BOOL) endsWith:(NSMutableString*)s end:(NSMutableString*)end;
+ (BOOL) isSpace:(NSMutableString*)s pos:(int)pos;
+ (NSMutableString*) ltrim:(NSMutableString*)s;
+ (NSMutableString*) rtrim:(NSMutableString*)s;
+ (NSMutableString*) trim:(NSMutableString*)s;
+ (NSMutableString*) rpad:(NSMutableString*)s c:(NSMutableString*)c l:(int)l;
+ (NSMutableString*) lpad:(NSMutableString*)s c:(NSMutableString*)c l:(int)l;
+ (NSMutableString*) replace:(NSMutableString*)s sub:(NSMutableString*)sub by:(NSMutableString*)by;
+ (NSMutableString*) hex:(int)n digits:(id)digits;
+ (int) fastCodeAt:(NSMutableString*)s index:(int)index;
+ (BOOL) isEOF:(int)c;

@end
