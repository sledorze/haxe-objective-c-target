package objc.foundation;


extern class NSScanner, implements NSCopying
{

	//Constants

	//Static Methods
	public  function scannerWithString( string:String):Dynamic;
	public  function localizedScannerWithString( string:String):Dynamic;

	//Properties

	//Methods
	public  function scanLongLong( value:longlong):Bool;
	public  function setCaseSensitive( flag:Bool):Void;
	public  function scanInt( value:int):Bool;
	public  function scanHexLongLong( result:unsignedlonglong):Bool;
	public  function scanInteger( value:Int):Bool;
	public  function scanHexDouble( result:double):Bool;
	public  function scanFloat( value:float):Bool;
	public  function scanCharactersFromSet( set:NSCharacterSet,  value:NSString*):Bool;
	public  function string():String;
	public  function setScanLocation( pos:Int):Void;
	public  function scanHexFloat( result:float):Bool;
	public  function locale():Dynamic;
	public  function scanUpToString( string:String,  value:NSString*):Bool;
	public  function initWithString( string:String):Dynamic;
	public  function scanLocation():Int;
	public  function setCharactersToBeSkipped( set:NSCharacterSet):Void;
	public  function setLocale( locale:Dynamic):Void;
	public  function charactersToBeSkipped():NSCharacterSet;
	public  function scanDouble( value:double):Bool;
	public  function isAtEnd():Bool;
	public  function scanHexInt( value:unsigned):Bool;
	public  function scanUpToCharactersFromSet( set:NSCharacterSet,  value:NSString*):Bool;
	public  function caseSensitive():Bool;
	public  function scanString( string:String,  value:NSString*):Bool;
}

