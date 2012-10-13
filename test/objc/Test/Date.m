#import "Date.h"

@implementation Date
-  (void) Dateyear:(NSNumber*)year = nil month:(NSNumber*)month = nil day:(NSNumber*)day = nil hour:(NSNumber*)hour = nil min:(NSNumber*)min = nil sec:(NSNumber*)sec = nil{ if( !flash.Boot.skip_constructor ) {self.mSeconds = __global__.__hxcpp_new_date[year month day hour min sec]}}@end