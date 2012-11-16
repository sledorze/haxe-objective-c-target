package objc.foundation;


extern class NSValue, implements NSCopying, implements NSSecureCoding
{

	//Constants

	//Static Methods
	public  function valueWithNonretainedObject( anObject:Dynamic):NSValue;
	public  function numberWithChar( value:char):Float;
	public  function numberWithUnsignedInt( value:Int):Float;
	public  function numberWithLongLong( value:longlong):Float;
	public  function numberWithBool( value:Bool):Float;
	public  function valueWithPointer( pointer:constvoid):NSValue;
	public  function numberWithUnsignedLongLong( value:unsignedlonglong):Float;
	public  function numberWithDouble( value:Float):Float;
	public  function numberWithFloat( value:Float):Float;
	public  function numberWithInteger( value:Int):Float;
	public  function valueWithBytes( value:constvoid,  type:constchar):NSValue;
	public  function value( value:constvoid,  type:constchar):NSValue;
	public  function numberWithUnsignedShort( value:unsignedshort):Float;
	public  function numberWithUnsignedLong( value:unsignedlong):Float;
	public  function numberWithUnsignedInteger( value:Int):Float;
	public  function numberWithShort( value:short):Float;
	public  function numberWithInt( value:Int):Float;
	public  function numberWithLong( value:long):Float;
	public  function numberWithUnsignedChar( value:unsignedchar):Float;

	//Properties

	//Methods
	public  function intValue():Int;
	public  function isEqualToNumber( number:Float):Bool;
	public  function longLongValue():longlong;
	public  function initWithUnsignedLong( value:unsignedlong):Dynamic;
	public  function unsignedIntegerValue():Int;
	public  function shortValue():short;
	public  function initWithUnsignedChar( value:unsignedchar):Dynamic;
	public  function objCType():constchar;
	public  function unsignedShortValue():unsignedshort;
	public  function getValue( value:Dynamic):Void;
	public  function longValue():long;
	public  function unsignedLongValue():unsignedlong;
	public  function charValue():char;
	public  function floatValue():Float;
	public  function unsignedCharValue():unsignedchar;
	public  function integerValue():Int;
	public  function initWithInt( value:Int):Dynamic;
	public  function pointerValue():Dynamic;
	public  function initWithLong( value:long):Dynamic;
	public  function initWithLongLong( value:longlong):Dynamic;
	public  function isEqualToValue( value:NSValue):Bool;
	public  function doubleValue():Float;
	public  function initWithChar( value:char):Dynamic;
	public  function initWithUnsignedInt( value:Int):Dynamic;
	public  function initWithBool( value:Bool):Dynamic;
	public  function initWithInteger( value:Int):Dynamic;
	public  function initWithShort( value:short):Dynamic;
	public  function initWithFloat( value:Float):Dynamic;
	public  function initWithBytes( value:constvoid,  type:constchar):Dynamic;
	public  function unsignedIntValue():Int;
	public  function initWithUnsignedShort( value:unsignedshort):Dynamic;
	public  function initWithUnsignedLongLong( value:unsignedlonglong):Dynamic;
	public  function initWithDouble( value:Float):Dynamic;
	public  function stringValue():String;
	public  function nonretainedObjectValue():Dynamic;
	public  function boolValue():Bool;
	public  function initWithUnsignedInteger( value:Int):Dynamic;
	public  function compare( otherNumber:Float):NSComparisonResult;
	public  function unsignedLongLongValue():unsignedlonglong;
	public  function descriptionWithLocale( locale:Dynamic):String;
}

