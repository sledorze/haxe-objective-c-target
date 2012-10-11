//
// File generated with the Haxe Objective-C target.
//
#import flash.Boot

#import "Date.h"

@implementation Date
;
		-  (void) Dateyear:(NSNumber*)year = nil month:(NSNumber*)month = nil day:(NSNumber*)day = nil hour:(NSNumber*)hour = nil min:(NSNumber*)min = nil sec:(NSNumber*)sec = nil{ if( !flash.Boot.skip_constructor ) {
			self.mSeconds = __global__.__hxcpp_new_date(year,month,day,hour,min,sec);
		}}
		
		+  (Date) now{
			return Date["fromTime"](__global__.__hxcpp_date_now() * 1000.0);
		}
		
		+  (Date) fromTimet:(NSNumber*)t{
			var result : Date = new Date([NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0]);
			result.mSeconds = t * 0.001;
			return result;
		}
		
		+  (Date) fromStrings:(NSString*)s{
			switch(s.length) {
			case [NSNumber numberWithInt:8]:
			{
				var k : NSMutableArray = s.split(@":");
				var d : Date = new Date([NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],Std._parseInt(k[[NSNumber numberWithInt:0]]),Std._parseInt(k[[NSNumber numberWithInt:1]]),Std._parseInt(k[[NSNumber numberWithInt:2]]));
				return d;
			}
			break;
			case [NSNumber numberWithInt:10]:
			{
				var k : NSMutableArray = s.split(@"-");
				return new Date(Std._parseInt(k[[NSNumber numberWithInt:0]]),Std._parseInt(k[[NSNumber numberWithInt:1]]) - [NSNumber numberWithInt:1],Std._parseInt(k[[NSNumber numberWithInt:2]]),[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0]);
			}
			break;
			case [NSNumber numberWithInt:19]:
			{
				var k : NSMutableArray = s.split(@" ");
				var y : NSMutableArray = k[[NSNumber numberWithInt:0]].split(@"-");
				var t : NSMutableArray = k[[NSNumber numberWithInt:1]].split(@":");
				return new Date(Std._parseInt(y[[NSNumber numberWithInt:0]]),Std._parseInt(y[[NSNumber numberWithInt:1]]) - [NSNumber numberWithInt:1],Std._parseInt(y[[NSNumber numberWithInt:2]]),Std._parseInt(t[[NSNumber numberWithInt:0]]),Std._parseInt(t[[NSNumber numberWithInt:1]]),Std._parseInt(t[[NSNumber numberWithInt:2]]));
			}
			break;
			default:
			throw @"Invalid date format : " + s;
			break;
			}
			return nil;
		}
		
		-  (NSString) toString{
			return __global__.__hxcpp_to_string(self.mSeconds);
		}
		
		-  (NSNumber) getDay{
			return __global__.__hxcpp_get_day(self.mSeconds);
		}
		
		-  (NSNumber) getDate{
			return __global__.__hxcpp_get_date(self.mSeconds);
		}
		
		-  (NSNumber) getMonth{
			return __global__.__hxcpp_get_month(self.mSeconds);
		}
		
		-  (NSNumber) getFullYear{
			return __global__.__hxcpp_get_year(self.mSeconds);
		}
		
		-  (NSNumber) getSeconds{
			return __global__.__hxcpp_get_seconds(self.mSeconds);
		}
		
		-  (NSNumber) getMinutes{
			return __global__.__hxcpp_get_minutes(self.mSeconds);
		}
		
		-  (NSNumber) getHours{
			return __global__.__hxcpp_get_hours(self.mSeconds);
		}
		
		-  (NSNumber) getTime{
			return self.mSeconds * 1000.0;
		}
		
		-  var mSeconds : NSNumber;
@end;
