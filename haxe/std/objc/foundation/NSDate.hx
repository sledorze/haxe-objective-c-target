package objc.foundation;
import objc.foundation.NSObject;
typedef NSTimeInterval = Int;
typedef NSComparisonResult = Int;

extern class NSDate extends NSObject, implements NSCopying, implements NSSecureCoding {

	//Constants

	//Static Methods
	public static function timeIntervalSinceReferenceDate () :NSTimeInterval;
	public static function dateWithTimeInterval( ti:NSTimeInterval,  date:Date):Dynamic;
	public static function distantFuture():Dynamic;
	public static function distantPast():Dynamic;
	public static function dateWithTimeIntervalSinceReferenceDate( secs:NSTimeInterval):Dynamic;
	public static function dateWithTimeIntervalSince1970( secs:NSTimeInterval):Dynamic;
	public static function date():Dynamic;
	public static function dateWithTimeIntervalSinceNow( secs:NSTimeInterval):Dynamic;

	//Properties

	//Methods
	//public  function timeIntervalSinceReferenceDate():NSTimeInterval;
	public  function timeIntervalSinceNow():NSTimeInterval;
	public  function initWithTimeInterval( secsToBeAdded:NSTimeInterval, anotherDate:Date) :Dynamic;
	public  function addTimeInterval( seconds:NSTimeInterval) :Dynamic;
	public  function laterDate( anotherDate:Date):Date;
	public  function description():String;
	public  function initWithTimeIntervalSinceNow( secs:NSTimeInterval):Dynamic;
	public  function dateByAddingTimeInterval( ti:NSTimeInterval):Dynamic;
	public  function timeIntervalSince1970():NSTimeInterval;
	public  function compare (other:NSDate) :NSComparisonResult;
	public  function isEqualToDate (otherDate:NSDate) :Bool;
	public  function initWithTimeIntervalSinceReferenceDate( secsToBeAdded:NSTimeInterval):Dynamic;
	public  function initWithTimeIntervalSince1970( ti:NSTimeInterval):Dynamic;
	public  function timeIntervalSinceDate( anotherDate:Date):NSTimeInterval;
	public  function earlierDate( anotherDate:Date):Date;
	public  function descriptionWithLocale( locale:Dynamic):String;
	public  function init() :NSDate;
}

