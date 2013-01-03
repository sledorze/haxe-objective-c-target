//
//  Date
//  Tests
//
//  Source generated by Haxe Objective-C target
//

#import "Date.h"

@implementation NSDate ( Date )

+ (NSDate*) now{
	
	NSCalendar *calendar = [NSCalendarFA_TAnon_ FA_  currentCalendar];
	
	NSDateComponents *components = [calendar FA_  components:7 fromDate:[NSDateFA_TAnon_ FA_  date]];
	return [[NSDate alloc] init:[components FA_  year] month:[components FA_  month] day:[components FA_  day] hour:[components FA_  hour] min:[components FA_  minute] sec:[components FA_  second]];
}
+ (NSDate*) fromTime:(float)t{
	
	NSDate *result = [[NSDate alloc] init:0 month:0 day:0 hour:0 min:0 sec:0];
	result. _seconds = t * 0.001;
	return result;
}
+ (NSDate*) fromString:(NSMutableString*)s{
	switch (s.length){
		case 8:{
			{
				
				NSMutableArray *k = [s  componentsSeparatedByString:@":"];
				
				NSDate *d = [[NSDate alloc] init:0 month:0 day:0 hour:[StdFA_TAnon_ FA_  parseInt:[k objectAtIndex:0]] min:[StdFA_TAnon_ FA_  parseInt:[k objectAtIndex:1]] sec:[StdFA_TAnon_ FA_  parseInt:[k objectAtIndex:2]]];
				return d;
			}}break;
		case 10:{
			{
				
				NSMutableArray *k = [s  componentsSeparatedByString:@"-"];
				return [[NSDate alloc] init:[StdFA_TAnon_ FA_  parseInt:[k objectAtIndex:0]] month:[StdFA_TAnon_ FA_  parseInt:[k objectAtIndex:1]] - 1 day:[StdFA_TAnon_ FA_  parseInt:[k objectAtIndex:2]] hour:0 min:0 sec:0];
			}}break;
		case 19:{
			{
				
				NSMutableArray *k = [s  componentsSeparatedByString:@" "];
				
				NSMutableArray *y = [[k objectAtIndex:0]  componentsSeparatedByString:@"-"];
				
				NSMutableArray *t = [[k objectAtIndex:1]  componentsSeparatedByString:@":"];
				return [[NSDate alloc] init:[StdFA_TAnon_ FA_  parseInt:[y objectAtIndex:0]] month:[StdFA_TAnon_ FA_  parseInt:[y objectAtIndex:1]] - 1 day:[StdFA_TAnon_ FA_  parseInt:[y objectAtIndex:2]] hour:[StdFA_TAnon_ FA_  parseInt:[t objectAtIndex:0]] min:[StdFA_TAnon_ FA_  parseInt:[t objectAtIndex:1]] sec:[StdFA_TAnon_ FA_  parseInt:[t objectAtIndex:2]]];
			}}break;
		default:{
			@throw [@"Invalid date format : " stringByAppendingString:s]}break
	}
	return nil;
}
static float _seconds__;
- (float) _seconds{
	return _seconds__;
}
- (void) set_seconds:(float)val{
	_seconds__ = val;
}
static NSCalendar* _calendar__;
- (NSCalendar*) _calendar{
	return _calendar__;
}
- (void) set_calendar:(NSCalendar*)val{
	_calendar__ = val;
}
static NSDateComponents* _components__;
- (NSDateComponents*) _components{
	return _components__;
}
- (void) set_components:(NSDateComponents*)val{
	_components__ = val;
}
- (float) getTime{
	return self.._seconds * 1000.0;
}
- (int) getHours{
	return [self ._components FA_  hour];
}
- (int) getMinutes{
	return [self ._components FA_  minute];
}
- (int) getSeconds{
	return [self ._components FA_  second];
}
- (int) getFullYear{
	return [self ._components FA_  year];
}
- (int) getMonth{
	return [self ._components FA_  month];
}
- (int) getDate{
	return [self ._components FA_  weekday];
}
- (int) getDay{
	return [self ._components FA_  day];
}
- (NSMutableString*) toString{
	return nil;
}
- (id) init:(int)year month:(int)month day:(int)day hour:(int)hour min:(int)min sec:(int)sec{
	self = [super init];
	self.._calendar = [NSCalendarFA_TAnon_ FA_  currentCalendar];
	self.._components = [self ._calendar FA_  components:7 fromDate:[NSDateFA_TAnon_ FA_  date]];
	[self ._components FA_  setYear:year];
	[self ._components FA_  setMonth:month];
	[self ._components FA_  setDay:day];
	[self ._components FA_  setHour:hour];
	[self ._components FA_  setMinute:min];
	[self ._components FA_  setSecond:sec];
	self = _calendar.dateFromComponents ( _components );
	return self;
}

@end
