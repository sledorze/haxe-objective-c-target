

#import "Date.h"
#import "StringTools.h"
#import "Std.h"
#import "DateTools.h"
#import "StringBuf.h"
#import "Array.h"

@interface DateTools : NSObject

-F-
+ (NSMutableString*) __format_get:(NSDate*)d e:(NSMutableString*)e;
-F-
+ (NSMutableString*) __format:(NSDate*)d f:(NSMutableString*)f;
-F-
+ (NSMutableString*) format:(NSDate*)d f:(NSMutableString*)f;
-F-
+ (NSDate*) delta:(NSDate*)d t:(float)t;
-F-
+ (NSMutabeArray*) DAYS_OF_MONTH:(NSMutabeArray*)val;
-F-
+ (int) getMonthDays:(NSDate*)d;
-F-
+ (float) seconds:(float)n;
-F-
+ (float) minutes:(float)n;
-F-
+ (float) hours:(float)n;
-F-
+ (float) days:(float)n;
-F-
+ (id) parse:(float)t;
-F-
+ (float) make:(id)o;

@end
