#import "Date.h"

@implementation Date

+ (NSDate*) now{
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	
	NSDateComponents *components = [calendar components:7 fromDate:[NSDate date]];
	return [[NSDate alloc] new:[components year],[components month],[components day],[components hour],[components minute],[components second]][];
}
+ (NSDate*) fromTime:(float)t{
	
	NSDate *result = [[NSDate alloc] new:0,0,0,0,0,0][];
	result._seconds = t * 0.001;
	return result;
}
+ (NSDate*) fromString:(NSMutableString*)s{
	switch (s.length){
		case 8:{
			{
				
				NSMutabeArray *k = [s componentsSeparatedByString:split:@":"];
				
				NSDate *d = [[NSDate alloc] new:0,0,0,[Std parseInt:[k objectAtIndex:0]],[Std parseInt:[k objectAtIndex:1]],[Std parseInt:[k objectAtIndex:2]]][];
				return d;
			}}break;
		case 10:{
			{
				
				NSMutabeArray *k = [s componentsSeparatedByString:split:@"-"];
				return [[NSDate alloc] new:[Std parseInt:[k objectAtIndex:0]],[Std parseInt:[k objectAtIndex:1]] - 1,[Std parseInt:[k objectAtIndex:2]],0,0,0][];
			}}break;
		case 19:{
			{
				
				NSMutabeArray *k = [s componentsSeparatedByString:split:@" "];
				
				NSMutabeArray *y = [[k objectAtIndex:0] componentsSeparatedByString:split:@"-"];
				
				NSMutabeArray *t = [[k objectAtIndex:1] componentsSeparatedByString:split:@":"];
				return [[NSDate alloc] new:[Std parseInt:[y objectAtIndex:0]],[Std parseInt:[y objectAtIndex:1]] - 1,[Std parseInt:[y objectAtIndex:2]],[Std parseInt:[t objectAtIndex:0]],[Std parseInt:[t objectAtIndex:1]],[Std parseInt:[t objectAtIndex:2]]][];
			}}break;
		default:{
			throw @"Invalid date format : " + s}break
	}
	return nil;
}
@synthesize _seconds;
@synthesize _calendar;
@synthesize _components;
- (float) getTime{
	return self._seconds * 1000.0;
}
- (int) getHours{
	return [self._components hour];
}
- (int) getMinutes{
	return [self._components minute];
}
- (int) getSeconds{
	return [self._components second];
}
- (int) getFullYear{
	return [self._components year];
}
- (int) getMonth{
	return [self._components month];
}
- (int) getDate{
	return [self._components weekday];
}
- (int) getDay{
	return [self._components day];
}
- (NSMutableString*) toString{
	return nil;
}
- (id) new:(int)year month:(int)month day:(int)day hour:(int)hour min:(int)min sec:(int)sec{
	self = [super init];
	self._calendar = [NSCalendar currentCalendar];
	self._components = [self._calendar components:7 fromDate:[NSDate date]];
	[self._components setYear:year];
	[self._components setMonth:month];
	[self._components setDay:day];
	[self._components setHour:hour];
	[self._components setMinute:min];
	[self._components setSecond:sec];
	self = _calendar.dateFromComponents ( _components );
	return self;
}

@end