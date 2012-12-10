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
	public  function setLongEraSymbols( array:Array<>):Void;
	public  function formatterBehavior():NSDateFormatterBehavior;
	public  function shortStandaloneQuarterSymbols():Array<>;
	public  function calendar():NSCalendar;
	public  function setShortStandaloneQuarterSymbols( array:Array<>):Void;
	public  function isLenient():Bool;
	public  function setMonthSymbols( array:Array<>):Void;
	public  function shortQuarterSymbols():Array<>;
	public  function setLocale( locale:NSLocale):Void;
	public  function dateFromString( string:String):Date;
	public  function dateStyle():NSDateFormatterStyle;
	public  function setLenient( b:Bool):Void;
	public  function PMSymbol():String;
	public  function setTimeStyle( style:NSDateFormatterStyle):Void;
	public  function setVeryShortWeekdaySymbols( array:Array<>):Void;
	public  function setGeneratesCalendarDates( b:Bool):Void;
	public  function setStandaloneWeekdaySymbols( array:Array<>):Void;
	public  function veryShortStandaloneWeekdaySymbols():Array<>;
	public  function gregorianStartDate():Date;
	public  function timeStyle():NSDateFormatterStyle;
	public  function dateFormat():String;
	public  function setTimeZone( tz:NSTimeZone):Void;
	public  function setShortStandaloneMonthSymbols( array:Array<>):Void;
	public  function veryShortWeekdaySymbols():Array<>;
	public  function setVeryShortStandaloneMonthSymbols( array:Array<>):Void;
	public  function setVeryShortStandaloneWeekdaySymbols( array:Array<>):Void;
	public  function shortMonthSymbols():Array<>;
	public  function setPMSymbol( string:String):Void;
	public  function setStandaloneMonthSymbols( array:Array<>):Void;
	public override function getObjectValue( obj:outid,  string:String,  rangep:inoutNSRange,  error:outNSError*):Bool;
	public  function AMSymbol():String;
	public  function stringFromDate( date:Date):String;
	public  function setShortMonthSymbols( array:Array<>):Void;
	public  function setShortWeekdaySymbols( array:Array<>):Void;
	public  function weekdaySymbols():Array<>;
	public  function initWithDateFormat( format:String,  flag:Bool):Dynamic;
	public  function shortWeekdaySymbols():Array<>;
	public  function longEraSymbols():Array<>;
	public  function setTwoDigitStartDate( date:Date):Void;
	public  function setDefaultDate( date:Date):Void;
	public  function allowsNaturalLanguage():Bool;
	public  function locale():NSLocale;
	public  function setAMSymbol( string:String):Void;
	public  function setEraSymbols( array:Array<>):Void;
	public  function standaloneWeekdaySymbols():Array<>;
	public  function setDateFormat( string:String):Void;
	public  function defaultDate():Date;
	public  function shortStandaloneWeekdaySymbols():Array<>;
	public  function generatesCalendarDates():Bool;
	public  function setShortQuarterSymbols( array:Array<>):Void;
	public  function eraSymbols():Array<>;
	public  function monthSymbols():Array<>;
	public  function setWeekdaySymbols( array:Array<>):Void;
	public  function quarterSymbols():Array<>;
	public  function setGregorianStartDate( date:Date):Void;
	public  function setDateStyle( style:NSDateFormatterStyle):Void;
	public  function veryShortStandaloneMonthSymbols():Array<>;
	public  function setStandaloneQuarterSymbols( array:Array<>):Void;
	public  function setCalendar( calendar:NSCalendar):Void;
	public  function shortStandaloneMonthSymbols():Array<>;
	public  function setFormatterBehavior( behavior:NSDateFormatterBehavior):Void;
	public  function setShortStandaloneWeekdaySymbols( array:Array<>):Void;
	public  function veryShortMonthSymbols():Array<>;
	public  function setVeryShortMonthSymbols( array:Array<>):Void;
	public  function setQuarterSymbols( array:Array<>):Void;
	public  function standaloneMonthSymbols():Array<>;
	public  function standaloneQuarterSymbols():Array<>;
	public  function doesRelativeDateFormatting():Bool;
}

extern enum NSDateFormatterBehavior
{
	NSDateFormatterBehaviorDefault;
	#if;
	#endif;
}

