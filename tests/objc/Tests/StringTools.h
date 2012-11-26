

#import "StringTools.h"

@interface StringTools : NSObject

-F-
+ (NSMutableString*) urlEncode:(NSMutableString*)s;
-F-
+ (NSMutableString*) urlDecode:(NSMutableString*)s;
-F-
+ (NSMutableString*) htmlEscape:(NSMutableString*)s;
-F-
+ (NSMutableString*) htmlUnescape:(NSMutableString*)s;
-F-
+ (BOOL) startsWith:(NSMutableString*)s start:(NSMutableString*)start;
-F-
+ (BOOL) endsWith:(NSMutableString*)s end:(NSMutableString*)end;
-F-
+ (BOOL) isSpace:(NSMutableString*)s pos:(int)pos;
-F-
+ (NSMutableString*) ltrim:(NSMutableString*)s;
-F-
+ (NSMutableString*) rtrim:(NSMutableString*)s;
-F-
+ (NSMutableString*) trim:(NSMutableString*)s;
-F-
+ (NSMutableString*) rpad:(NSMutableString*)s c:(NSMutableString*)c l:(int)l;
-F-
+ (NSMutableString*) lpad:(NSMutableString*)s c:(NSMutableString*)c l:(int)l;
-F-
+ (NSMutableString*) replace:(NSMutableString*)s sub:(NSMutableString*)sub by:(NSMutableString*)by;
-F-
+ (NSMutableString*) hex:(int)n digits:(id)digits;
-F-
+ (int) fastCodeAt:(NSMutableString*)s index:(int)index;
-F-
+ (BOOL) isEOF:(int)c;

@end
