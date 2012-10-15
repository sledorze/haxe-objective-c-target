
#import <UIKit/UIKit.h>


@interface Date<>


+ (Date*) now;

+ (Date*) fromTimet:(NSNumber*)t;

+ (Date*) fromStrings:(NSString*)s;

- (NSString*) toString;

- (NSNumber*) getDay;

- (NSNumber*) getDate;

- (NSNumber*) getMonth;

- (NSNumber*) getFullYear;

- (NSNumber*) getSeconds;

- (NSNumber*) getMinutes;

- (NSNumber*) getHours;

- (NSNumber*) getTime;



@end
