package objc.foundation;


extern class NSDateFormatter extends NSFormatter
{

	//Constants

	//Static Methods
	public  function localizedStringFromDate( date:Date,  dstyle:NSDateFormatterStyle,  tstyle:NSDateFormatterStyle):String;
	public  function defaultFormatterBehavior():NSDateFormatterBehavior;
	public  function setDefaultFormatterBehavior( behavior:NSDateFormatterBehavior):Void;
	public  function dateFormatFromTemplate( tmplate:String,  opts:Int,  locale:NSLocale):String;

	//Properties

	//Methods
	public  function timeZone():NSTimeZone;
	public  function twoDigitStartDate():Date;
	public  function setDoesRelativeDateFormatting( b:Bool):Void;
	public  function setLongEraSymbols( array:NSArray):Void;
	public  function formatterBehavior():NSDateFormatterBehavior;
	public  function shortStandaloneQuarterSymbols():NSArray;
	public  function calendar():NSCalendar;
	public  function setShortStandaloneQuarterSymbols( array:NSArray):Void;
	public  function isLenient():Bool;
	public  function setMonthSymbols( array:NSArray):Void;
	public  function shortQuarterSymbols():NSArray;
	public  function setLocale( locale:NSLocale):Void;
	public  function dateFromString( string:String):Date;
	public  function dateStyle():NSDateFormatterStyle;
	public  function setLenient( b:Bool):Void;
	public  function PMSymbol():String;
	public  function setTimeStyle( style:NSDateFormatterStyle):Void;
	public  function setVeryShortWeekdaySymbols( array:NSArray):Void;
	public  function setGeneratesCalendarDates( b:Bool):Void;
	public  function setStandaloneWeekdaySymbols( array:NSArray):Void;
	public  function veryShortStandaloneWeekdaySymbols():NSArray;
	public  function gregorianStartDate():Date;
	public  function timeStyle():NSDateFormatterStyle;
	public  function dateFormat():String;
	public  function setTimeZone( tz:NSTimeZone):Void;
	public  function setShortStandaloneMonthSymbols( array:NSArray):Void;
	public  function veryShortWeekdaySymbols():NSArray;
	public  function setVeryShortStandaloneMonthSymbols( array:NSArray):Void;
	public  function setVeryShortStandaloneWeekdaySymbols( array:NSArray):Void;
	public  function shortMonthSymbols():NSArray;
	public  function setPMSymbol( string:String):Void;
	public  function setStandaloneMonthSymbols( array:NSArray):Void;
	public override function getObjectValue( obj:outid,  string:String,  rangep:inoutNSRange,  error:outNSError*):Bool;
	public  function AMSymbol():String;
	public  function stringFromDate( date:Date):String;
	public  function setShortMonthSymbols( array:NSArray):Void;
	public  function setShortWeekdaySymbols( array:NSArray):Void;
	public  function weekdaySymbols():NSArray;
	public  function initWithDateFormat( format:String,  flag:Bool):Dynamic;
	public  function shortWeekdaySymbols():NSArray;
	public  function longEraSymbols():NSArray;
	public  function setTwoDigitStartDate( date:Date):Void;
	public  function setDefaultDate( date:Date):Void;
	public  function allowsNaturalLanguage():Bool;
	public  function locale():NSLocale;
	public  function setAMSymbol( string:String):Void;
	public  function setEraSymbols( array:NSArray):Void;
	public  function standaloneWeekdaySymbols():NSArray;
	public  function setDateFormat( string:String):Void;
	public  function defaultDate():Date;
	public  function shortStandaloneWeekdaySymbols():NSArray;
	public  function generatesCalendarDates():Bool;
	public  function setShortQuarterSymbols( array:NSArray):Void;
	public  function eraSymbols():NSArray;
	public  function monthSymbols():NSArray;
	public  function setWeekdaySymbols( array:NSArray):Void;
	public  function quarterSymbols():NSArray;
	public  function setGregorianStartDate( date:Date):Void;
	public  function setDateStyle( style:NSDateFormatterStyle):Void;
	public  function veryShortStandaloneMonthSymbols():NSArray;
	public  function setStandaloneQuarterSymbols( array:NSArray):Void;
	public  function setCalendar( calendar:NSCalendar):Void;
	public  function shortStandaloneMonthSymbols():NSArray;
	public  function setFormatterBehavior( behavior:NSDateFormatterBehavior):Void;
	public  function setShortStandaloneWeekdaySymbols( array:NSArray):Void;
	public  function veryShortMonthSymbols():NSArray;
	public  function setVeryShortMonthSymbols( array:NSArray):Void;
	public  function setQuarterSymbols( array:NSArray):Void;
	public  function standaloneMonthSymbols():NSArray;
	public  function standaloneQuarterSymbols():NSArray;
	public  function doesRelativeDateFormatting():Bool;
}

extern enum NSDateFormatterBehavior
{
	NSDateFormatterBehaviorDefault;
	#if;
	#endif;
}

