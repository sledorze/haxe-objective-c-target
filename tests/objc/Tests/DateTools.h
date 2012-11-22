

#import "Int.h"
#import "StringBuf.h"
#import "Float.h"

@interface DateTools : NSObject

+ (NSString*) __format_get:(Date*)d e:(NSString*)e;
+ (NSString*) __format:(Date*)d f:(NSString*)f;
+ (NSString*) format:(Date*)d f:(NSString*)f;
+ (Date*) delta:(Date*)d t:(float)t;
+ (NSMutabeArray*) DAYS_OF_MONTH:(NSMutabeArray*)val;
+ (int) getMonthDays:(Date*)d;
+ (float) seconds:(float)n;
+ (float) minutes:(float)n;
+ (float) hours:(float)n;
+ (float) days:(float)n;
+ (id) parse:(float)t;
+ (float) make:(id)o;

@end
