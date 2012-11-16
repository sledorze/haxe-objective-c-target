package objc.foundation;

import objc.foundation.NSLocale;
import objc.foundation.NSTimeZone;
import objc.foundation.NSString;

/*enum NSCalendarUnit {
	NSEraCalendarUnit = kCFCalendarUnitEra,
	NSYearCalendarUnit = kCFCalendarUnitYear,
	NSMonthCalendarUnit = kCFCalendarUnitMonth,
	NSDayCalendarUnit = kCFCalendarUnitDay,
	NSHourCalendarUnit = kCFCalendarUnitHour,
	NSMinuteCalendarUnit = kCFCalendarUnitMinute,
	NSSecondCalendarUnit = kCFCalendarUnitSecond,
	NSWeekdayCalendarUnit = kCFCalendarUnitWeekday,
	NSWeekdayOrdinalCalendarUnit = kCFCalendarUnitWeekdayOrdinal,
#if MAC_OS_X_VERSION_10_6 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_4_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
	NSQuarterCalendarUnit = kCFCalendarUnitQuarter,
#endif
#if MAC_OS_X_VERSION_10_7 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_5_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
	NSWeekOfMonthCalendarUnit = kCFCalendarUnitWeekOfMonth,
	NSWeekOfYearCalendarUnit = kCFCalendarUnitWeekOfYear,
	NSYearForWeekOfYearCalendarUnit = kCFCalendarUnitYearForWeekOfYear,
#endif
#if MAC_OS_X_VERSION_10_7 <= MAC_OS_X_VERSION_MAX_ALLOWED || __IPHONE_4_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
        NSCalendarCalendarUnit = (1 << 20),
        NSTimeZoneCalendarUnit = (1 << 21),
#endif
};*/
typedef NSCalendarUnit = Int;

extern class NSCalendar extends NSObject/*, implements NSCopying, implements NSCoding*/ {

	public static function currentCalendar () :NSCalendar; // users preferred calendar, tracks changes
	public static function autoupdatingCurrentCalendar () :NSCalendar;

	public function initWithCalendarIdentifier (ident:String) :NSCalendar;

	public function calendarIdentifier () :String;


	public function setLocale (locale:NSLocale) :Void;
	public function locale () :NSLocale;

	public function setTimeZone (tz:NSTimeZone) :Void;
	public function timeZone () :NSTimeZone;

	public function setFirstWeekday (weekday:Int) :Void;
	public function firstWeekday () :Int;

	public function setMinimumDaysInFirstWeek (mdw:Int) :Void;
	public function minimumDaysInFirstWeek () :Int;


	public function minimumRangeOfUnit(unit:NSCalendarUnit) :NSRange;
	public function maximumRangeOfUnit(unit:NSCalendarUnit) :NSRange;

	public function rangeOfUnit (smaller:NSCalendarUnit, inUnit:NSCalendarUnit, forDate:NSDate) :NSRange;
	public function ordinalityOfUnit (smaller:NSCalendarUnit, inUnit:NSCalendarUnit, forDate:NSDate) :NSRange;

	public function rangeOfUnit (unit:NSCalendarUnit, startDate:NSDate, interval:NSTimeInterval, forDate:NSDate) :Bool;

	public function dateFromComponents (comps:NSDateComponents) :NSDate;
	public function components (unitFlags:Int, fromDate:NSDate) :NSDateComponents;

	public function dateByAddingComponents (comps:NSDateComponents, toDate:NSDate, options:Int) :NSDate;

	public function components (unitFlags:Int, fromDate:NSDate, toDate:NSDate, options:Int) :NSDateComponents;



// This is a just used as an extensible struct, basically;
// note that there are two uses: one for specifying a date
// via components (some components may be missing, making the
// specific date ambiguous), and the other for specifying a
// set of component quantities (like, 3 months and 5 hours).
// Undefined fields have (or fields can be set to) the value
// NSUndefinedDateComponent.
// NSDateComponents is not responsible for answering questions
// about a date beyond the information it has been initialized
// with; for example, if you initialize one with May 6, 2004,
// and then ask for the weekday, you'll get Undefined, not Thurs.
// A NSDateComponents is meaningless in itself, because you need
// to know what calendar it is interpreted against, and you need
// to know whether the values are absolute values of the units,
// or quantities of the units.
// When you create a new one of these, all values begin Undefined.

enum {
	NSUndefinedDateComponent = NSIntegerMax
};

extern class NSDateComponents extends NSObject/*, implements NSCopying, implements NSCoding*/ {

- (NSCalendar *)calendar NS_AVAILABLE(10_7, 4_0);
- (NSTimeZone *)timeZone NS_AVAILABLE(10_7, 4_0);
- (NSInteger)era;
- (NSInteger)year;
- (NSInteger)month;
- (NSInteger)day;
- (NSInteger)hour;
- (NSInteger)minute;
- (NSInteger)second;
- (NSInteger)week;
- (NSInteger)weekday;
- (NSInteger)weekdayOrdinal;
- (NSInteger)quarter NS_AVAILABLE(10_6, 4_0);
- (NSInteger)weekOfMonth NS_AVAILABLE(10_7, 5_0);
- (NSInteger)weekOfYear NS_AVAILABLE(10_7, 5_0);
- (NSInteger)yearForWeekOfYear NS_AVAILABLE(10_7, 5_0);

- (void)setCalendar:(NSCalendar *)cal NS_AVAILABLE(10_7, 4_0);
- (void)setTimeZone:(NSTimeZone *)tz NS_AVAILABLE(10_7, 4_0);
- (void)setEra:(NSInteger)v;
- (void)setYear:(NSInteger)v;
- (void)setMonth:(NSInteger)v;
- (void)setDay:(NSInteger)v;
- (void)setHour:(NSInteger)v;
- (void)setMinute:(NSInteger)v;
- (void)setSecond:(NSInteger)v;
- (void)setWeek:(NSInteger)v;
- (void)setWeekday:(NSInteger)v;
- (void)setWeekdayOrdinal:(NSInteger)v;
- (void)setQuarter:(NSInteger)v NS_AVAILABLE(10_6, 4_0);
- (void)setWeekOfMonth:(NSInteger)w NS_AVAILABLE(10_7, 5_0);
- (void)setWeekOfYear:(NSInteger)w NS_AVAILABLE(10_7, 5_0);
- (void)setYearForWeekOfYear:(NSInteger)y NS_AVAILABLE(10_7, 5_0);

- (NSDate *)date NS_AVAILABLE(10_7, 4_0);

@end

