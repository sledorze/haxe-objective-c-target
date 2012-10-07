// File generated with the new haXe objc target.
//
#import flash.Boot;

@implementation Date;
		- (void) Dateyear:(NSNumber*)year = nil month:(NSNumber*)month = nil day:(NSNumber*)day = nil hour:(NSNumber*)hour = nil min:(NSNumber*)min = nil sec:(NSNumber*)sec = nil{ if( !flash.Boot.skip_constructor ) {
			self.mSeconds = __global__.__hxcpp_new_date :year, month, day, hour, min, sec];
		}}
		
		NSNumber *mSeconds ;
		- (NSNumber) getTime{
			return self.mSeconds * 1000.0;
		}
		
		- (NSNumber) getHours{
			return __global__.__hxcpp_get_hours :self.mSeconds];
		}
		
		- (NSNumber) getMinutes{
			return __global__.__hxcpp_get_minutes :self.mSeconds];
		}
		
		- (NSNumber) getSeconds{
			return __global__.__hxcpp_get_seconds :self.mSeconds];
		}
		
		- (NSNumber) getFullYear{
			return __global__.__hxcpp_get_year :self.mSeconds];
		}
		
		- (NSNumber) getMonth{
			return __global__.__hxcpp_get_month :self.mSeconds];
		}
		
		- (NSNumber) getDate{
			return __global__.__hxcpp_get_date :self.mSeconds];
		}
		
		- (NSNumber) getDay{
			return __global__.__hxcpp_get_day :self.mSeconds];
		}
		
		- (NSString) toString{
			return __global__.__hxcpp_to_string :self.mSeconds];
		}
		
		+ (Date) now{
			return Date["fromTime"] :__global__.__hxcpp_date_now :] * 1000.0];
		}
		
		+ (Date) fromTimet:(NSNumber*)t{
			Date *result = [[Date alloc] init][NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0]);
			result.mSeconds = t * 0.001;
			return result;
		}
		
		+ (Date) fromStrings:(NSString*)s{
			switch(s.length) {
			case [NSNumber numberWithInt:8]:
			{
				NSMutableArray *k = s.split :@":"];
				Date *d = [[Date alloc] init][NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],Std._parseInt :k[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:0]]],Std._parseInt :k[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:1]]],Std._parseInt :k[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:2]]]);
				return d
			}
			break;
			case [NSNumber numberWithInt:10]:
			{
				NSMutableArray *k = s.split :@"-"];
				return [[Date alloc] init]Std._parseInt :k[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:0]]],Std._parseInt :k[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:1]]] - [NSNumber numberWithInt:1],Std._parseInt :k[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:2]]],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0]);
			}
			break;
			case [NSNumber numberWithInt:19]:
			{
				NSMutableArray *k = s.split :@" "];
				NSMutableArray *y = k[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:0]].split :@"-"];
				NSMutableArray *t = k[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:1]].split :@":"];
				return [[Date alloc] init]Std._parseInt :y[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:0]]],Std._parseInt :y[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:1]]] - [NSNumber numberWithInt:1],Std._parseInt :y[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:2]]],Std._parseInt :t[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:0]]],Std._parseInt :t[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:1]]],Std._parseInt :t[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:2]]]);
			}
			break;
			default:
			throw @"Invalid date format : " + s;
			break;
			}
			return nil;
		}
		
	@end

