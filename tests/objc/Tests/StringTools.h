

#import "Int.h"
#import "String.h"

@interface StringTools : NSObject

+ (NSString*) urlEncode:(NSString*)s;
+ (NSString*) urlDecode:(NSString*)s;
+ (NSString*) htmlEscape:(NSString*)s;
+ (NSString*) htmlUnescape:(NSString*)s;
+ (BOOL) startsWith:(NSString*)s start:(NSString*)start;
+ (BOOL) endsWith:(NSString*)s end:(NSString*)end;
+ (BOOL) isSpace:(NSString*)s pos:(int)pos;
+ (NSString*) ltrim:(NSString*)s;
+ (NSString*) rtrim:(NSString*)s;
+ (NSString*) trim:(NSString*)s;
+ (NSString*) rpad:(NSString*)s c:(NSString*)c l:(int)l;
+ (NSString*) lpad:(NSString*)s c:(NSString*)c l:(int)l;
+ (NSString*) replace:(NSString*)s sub:(NSString*)sub by:(NSString*)by;
+ (NSString*) hex:(int)n digits:(id)digits;
+ (int) fastCodeAt:(NSString*)s index:(int)index;
+ (BOOL) isEOF:(int)c;

@end
