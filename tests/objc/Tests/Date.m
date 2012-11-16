#import "Date.h"

@implementation Date

+ (Date*) now{
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	
	NSDateComponents *components = [calendar components:7 fromDate:[NSDate date]];
	return [[Date alloc] init][components year],[components month],[components day],[components hour],[components minute],[components second];
}
+ (Date*) fromTime:(float)t{
	
	Date *result = [[Date alloc] init]0,0,0,0,0,0;
	result._seconds = t * 0.001;
	return result;
}
+ (Date*) fromString:(NSString*)s{
	switch (s.length){
		case 8:{
			{
				
				Array *k = [s split:@":"];
				
				Date *d = [[Date alloc] init]0,0,0,[Std parseInt:[k objectAtIndex:0]],[Std parseInt:[k objectAtIndex:1]],[Std parseInt:[k objectAtIndex:2]];
				return d;
			}}break;
		case 10:{
			{
				
				Array *k = [s split:@"-"];
				return [[Date alloc] init][Std parseInt:[k objectAtIndex:0]],[Std parseInt:[k objectAtIndex:1]] - 1,[Std parseInt:[k objectAtIndex:2]],0,0,0;
			}}break;
		case 19:{
			{
				
				Array *k = [s split:@" "];
				
				Array *y = [[k objectAtIndex:0] split:@"-"];
				
				Array *t = [[k objectAtIndex:1] split:@":"];
				return [[Date alloc] init][Std parseInt:[y objectAtIndex:0]],[Std parseInt:[y objectAtIndex:1]] - 1,[Std parseInt:[y objectAtIndex:2]],[Std parseInt:[t objectAtIndex:0]],[Std parseInt:[t objectAtIndex:1]],[Std parseInt:[t objectAtIndex:2]];
			}}break;
		default:{
			throw @"Invalid date format : " + s}break
	}
	return nil;
}
@synthesize _seconds;
@synthesize _date;
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
- (NSString*) toString{
	return nil;
}

@end
