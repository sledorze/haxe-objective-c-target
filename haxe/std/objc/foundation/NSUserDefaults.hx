package objc.foundation;


extern class NSUserDefaults
{

	//Constants

	//Static Methods
	public  function standardUserDefaults():NSUserDefaults;
	public  function resetStandardUserDefaults():Void;

	//Properties

	//Methods
	public  function initWithUser( username:String):Dynamic;
	public  function objectForKey( defaultName:String):Dynamic;
	public  function persistentDomainForName( domainName:String):NSDictionary;
	public  function dictionaryForKey( defaultName:String):NSDictionary;
	public  function setBool( value:Bool,  defaultName:String):Void;
	public  function registerDefaults( registrationDictionary:NSDictionary):Void;
	public  function setObject( value:Dynamic,  defaultName:String):Void;
	public  function setPersistentDomain( domain:NSDictionary,  domainName:String):Void;
	public  function setURL( url:NSURL,  defaultName:String):Void;
	public  function setFloat( value:Float,  defaultName:String):Void;
	public  function doubleForKey( defaultName:String):Float;
	public  function persistentDomainNames():NSArray;
	public  function dataForKey( defaultName:String):NSData;
	public  function volatileDomainForName( domainName:String):NSDictionary;
	public  function removeVolatileDomainForName( domainName:String):Void;
	public  function arrayForKey( defaultName:String):NSArray;
	public  function setDouble( value:Float,  defaultName:String):Void;
	public  function removeSuiteNamed( suiteName:String):Void;
	public  function stringForKey( defaultName:String):String;
	public  function URLForKey( defaultName:String):NSURL;
	public  function dictionaryRepresentation():NSDictionary;
	public  function integerForKey( defaultName:String):Int;
	public  function setInteger( value:Int,  defaultName:String):Void;
	public  function floatForKey( defaultName:String):Float;
	public  function setVolatileDomain( domain:NSDictionary,  domainName:String):Void;
	public  function volatileDomainNames():NSArray;
	public  function synchronize():Bool;
	public  function objectIsForcedForKey( key:String):Bool;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function objectIsForcedForKey1( key:String,  domain:String):Bool;
	public  function stringArrayForKey( defaultName:String):NSArray;
	public  function boolForKey( defaultName:String):Bool;
	public  function removeObjectForKey( defaultName:String):Void;
	public  function addSuiteNamed( suiteName:String):Void;
	public  function removePersistentDomainForName( domainName:String):Void;
	public  function init():Dynamic;
}

