#import "DateTools.h"

@implementation DateTools
+ (NSString*) __format_get:(Date*)d e:(NSString*)e{
	return - (NSString*) switch (e){
		case @"%":{
			$r = @"%"}break;
		case @"C":{
			$r = [StringTools lpad:[Std string:[Std int:[d getFullYear] / 100]] c:@"0" l:2]}break;
		case @"d":{
			$r = [StringTools lpad:[Std string:[d getDate]] c:@"0" l:2]}break;
		case @"D":{
			$r = [DateTools __format:d f:@"%m/%d/%y"]}break;
		case @"e":{
			$r = [Std string:[d getDate]]}break;
		case @"H":case @"k":{
			$r = [StringTools lpad:[Std string:[d getHours]] c:( (e == @"H") ? @"0" : @" ") l:2]}break;
		case @"I":case @"l":{
			$r = - (NSString*) int hour = [d getHours] % 12
			$r2 = [StringTools lpad:[Std string:( (hour == 0) ? 12 : hour)] c:( (e == @"I") ? @"0" : @" ") l:2]
			return $r2{
				
				NSString* $r2}
			}()}break;
		case @"m":{
			$r = [StringTools lpad:[Std string:[d getMonth] + 1] c:@"0" l:2]}break;
		case @"M":{
			$r = [StringTools lpad:[Std string:[d getMinutes]] c:@"0" l:2]}break;
		case @"n":{
			$r = @"\n"}break;
		case @"p":{
			$r = ( ([d getHours] > 11) ? @"PM" : @"AM")}break;
		case @"r":{
			$r = [DateTools __format:d f:@"%I:%M:%S %p"]}break;
		case @"R":{
			$r = [DateTools __format:d f:@"%H:%M"]}break;
		case @"s":{
			$r = [Std string:[Std int:[d getTime] / 1000]]}break;
		case @"S":{
			$r = [StringTools lpad:[Std string:[d getSeconds]] c:@"0" l:2]}break;
		case @"t":{
			$r = @"\t"}break;
		case @"T":{
			$r = [DateTools __format:d f:@"%H:%M:%S"]}break;
		case @"u":{
			$r = - (NSString*) int t = [d getDay]
			$r3 = ( (t == 0) ? @"7" : [Std string:t])
			return $r3{
				
				NSString* $r3}
			}()}break;
		case @"w":{
			$r = [Std string:[d getDay]]}break;
		case @"y":{
			$r = [StringTools lpad:[Std string:[d getFullYear] % 100] c:@"0" l:2]}break;
		case @"Y":{
			$r = [Std string:[d getFullYear]]}break;
		default:{
			$r = - (NSString*) throw @"Date.format %" + e + @"- not implemented yet."
			return $r4{
				
				NSString* $r4}
			}()}break
	}
	return $r{
		
		NSString* $r}
	}();
}
+ (NSString*) __format:(Date*)d f:(NSString*)f{
	
	StringBuf *r = [[StringBuf alloc] init];
	int p = 0;
	while (YES) {
		int np = [f rangeOfString:@"%" startIndex:p];
		if (np < 0) break;;
		[r.b objectAtIndex:r.b.length] = [f substringWithRange:substr:p len:np - p];
		[r.b objectAtIndex:r.b.length] = [DateTools __format_get:d e:[f substringWithRange:substr:np + 1 len:1]];
		p = np + 2;
	}
	[r.b objectAtIndex:r.b.length] = [f substringWithRange:substr:p len:f length - p];
	return [r b join:@""];
}
+ (NSString*) format:(Date*)d f:(NSString*)f{
	return [DateTools __format:d f:f];
}
+ (Date*) delta:(Date*)d t:(float)t{
	return [Date fromTime:[d getTime] + t];
}
+ (NSMutabeArray*) DAYS_OF_MONTH:(NSMutabeArray*)val {
	static NSMutabeArray *_val;
	if (val == nil) { if (_val == nil) _val = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:31], [NSNumber numberWithInt:28], [NSNumber numberWithInt:31], [NSNumber numberWithInt:30], [NSNumber numberWithInt:31], [NSNumber numberWithInt:30], [NSNumber numberWithInt:31], [NSNumber numberWithInt:31], [NSNumber numberWithInt:30], [NSNumber numberWithInt:31], [NSNumber numberWithInt:30], [NSNumber numberWithInt:31], nil]]; }
	else { if (_val != nil) _val = val; }
	return _val;
}
+ (int) getMonthDays:(Date*)d{
	int month = [d getMonth];
	int year = [d getFullYear];
	if (month != 1) return [DateTools.DAYS_OF_MONTH objectAtIndex:month];;
	BOOL isB = year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
	return ( (isB) ? 29 : 28);
}
+ (float) seconds:(float)n{
	return n * 1000.0;
}
+ (float) minutes:(float)n{
	return n * 60.0 * 1000.0;
}
+ (float) hours:(float)n{
	return n * 60.0 * 60.0 * 1000.0;
}
+ (float) days:(float)n{
	return n * 24.0 * 60.0 * 60.0 * 1000.0;
}
+ (id) parse:(float)t{
	float s = t / 1000;
	float m = s / 60;
	float h = m / 60;
	return {ms:t % 1000 ,seconds:[Std int:s % 60] ,minutes:[Std int:m % 60] ,hours:[Std int:h % 24] ,days:[Std int:h / 24]};
}
+ (float) make:(id)o{
	return o GFA2 .ms + 1000.0 *  (o GFA2 .seconds + 60.0 *  (o GFA2 .minutes + 60.0 *  (o GFA2 .hours + 24.0 * o GFA2 .days)));
}

@end
