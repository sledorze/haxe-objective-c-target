
#import <Foundation/Foundation.h>

#import "Date.h"
#import "Array.h"

@interface Date : NSObject

+ (Date*) now;
+ (Date*) fromTime:(float)t;
+ (Date*) fromString:(NSString*)s;
@property (nonatomic) float _seconds;
@property (nonatomic, strong) NSDate *_date;
@property (nonatomic, strong) NSCalendar *_calendar;
@property (nonatomic, strong) NSDateComponents *_components;
- (float) getTime;
- (int) getHours;
- (int) getMinutes;
- (int) getSeconds;
- (int) getFullYear;
- (int) getMonth;
- (int) getDate;
- (int) getDay;
- (NSString*) toString;

@end
