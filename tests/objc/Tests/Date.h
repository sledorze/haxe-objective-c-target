
#import <Foundation/Foundation.h>

#import "Date.h"
#import "Array.h"
#import "Std.h"

@interface NSDate ( Date )

-F-
+ (NSDate*) now;
-F-
+ (NSDate*) fromTime:(float)t;
-F-
+ (NSDate*) fromString:(NSMutableString*)s;
-F-
@property (nonatomic) float _seconds;
-F-
@property (nonatomic, strong) NSCalendar *_calendar;
-F-
@property (nonatomic, strong) NSDateComponents *_components;
-F-
- (float) getTime;
-F-
- (int) getHours;
-F-
- (int) getMinutes;
-F-
- (int) getSeconds;
-F-
- (int) getFullYear;
-F-
- (int) getMonth;
-F-
- (int) getDate;
-F-
- (int) getDay;
-F-
- (NSMutableString*) toString;
-F-
- (id) new:(int)year month:(int)month day:(int)day hour:(int)hour min:(int)min sec:(int)sec;

@end
