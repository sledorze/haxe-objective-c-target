

#import "Int.h"
#import "StringBuf.h"
#import "Float.h"

@interface DateTools : NSObject

+ (NSString*) __format_get:(Date*)d e:(NSString*)e;
+ (NSString*) __format:(Date*)d f:(NSString*)f;
+ (NSString*) format:(Date*)d f:(NSString*)f;
+ (Date*) delta:(Date*)d t:(float)t;
@property (nonatomic, strong) Array *DAYS_OF_MONTH; = [[Array alloc] initWithNSMutableArray: [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:31], [NSNumber numberWithInt:28], [NSNumber numberWithInt:31], [NSNumber numberWithInt:30], [NSNumber numberWithInt:31], [NSNumber numberWithInt:30], [NSNumber numberWithInt:31], [NSNumber numberWithInt:31], [NSNumber numberWithInt:30], [NSNumber numberWithInt:31], [NSNumber numberWithInt:30], [NSNumber numberWithInt:31], nil]]
+ (int) getMonthDays:(Date*)d;
+ (float) seconds:(float)n;
+ (float) minutes:(float)n;
+ (float) hours:(float)n;
+ (float) days:(float)n;
+ (id) parse:(float)t;
+ (float) make:(id)o;

@end
