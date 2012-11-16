package objc.foundation;
import objc.foundation.NSObject;
typedef NSFastEnumeration = Dynamic;
typedef NSComparator = Dynamic;
typedef NSSortOptions = Dynamic;
typedef NSEnumerationOptions = Dynamic;

extern class NSDictionary extends NSObject, implements NSCopying, implements NSMutableCopying, implements NSSecureCoding, implements NSFastEnumeration {

	//Constants

	//Static Methods
	public static function dictionaryWithObject( object:Dynamic, key:NSCopying) :NSDictionary;
	public static function dictionaryWithContentsOfFile( path:String) :NSDictionary;
	public static function sharedKeySetForKeys (keys:Array<String>) :NSDictionary;
	public static function dictionaryWithContentsOfURL (url:NSURL) :NSDictionary;
	public static function dictionaryWithObjects( objects:Array<Dynamic>, keys:Array<String>, cnt:Int) :NSDictionary;
	//public static function dictionaryWithObjects1( objects:Array<Dynamic>, keys:Array<NSCopying>, cnt:Int) :Dynamic;
	//public static function dictionaryWithObjects2( objects:NSArray, keys:NSArray):Dynamic;
	public static function dictionaryWithDictionary( dict:NSDictionary) :NSDictionary;
	public static function dictionaryWithSharedKeySet( keyset:Dynamic) :NSDictionary;
	public static function dictionary():NSDictionary;
	public static function dictionaryWithObjectsAndKeys( firstObject:Dynamic) :NSDictionary;
	public static function dictionaryWithCapacity( numItems:Int) :NSDictionary;

	//Properties

	//Methods
	public  function objectForKey (aKey:String) :Dynamic;
	public  function enumerateKeysAndObjectsUsingBlock (block:Dynamic) :Void;
	public  function addEntriesFromDictionary( otherDictionary:NSDictionary):Void;
	public  function descriptionInStringsFileFormat():String;
	public  function keysSortedByValueUsingComparator( cmptr:NSComparator):NSArray;
	public  function objectEnumerator():NSEnumerator;
	public  function keysSortedByValueWithOptions( opts:NSSortOptions,  cmptr:NSComparator):NSArray;
	public  function initWithContentsOfFile (path:String) :NSDictionary;
	public  function setObject (anObject:Dynamic, aKey:NSCopying) :Void;
	//public  function setObject1(obj:Dynamic, key:NSCopying) :Void;
	public  function initWithDictionary( otherDictionary:NSDictionary) :NSDictionary;
	//public  function initWithDictionary1( otherDictionary:NSDictionary,  flag:Bool):Dynamic;
	public  function count():Int;
	public  function getObjects( objects:Dynamic, keys:Dynamic):Void;
	//public  function initWithObjects( objects:Array<Dynamic>, keys:Array<String>, cnt:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	//public  function initWithObjects1( objects:Array<Dynamic>, keys:Array<String>, cnt:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithObjects (objects:Array<Dynamic>, keys:Array<String>) :Dynamic;
	public  function allKeys() :Array<String>;
	public  function setDictionary( otherDictionary:NSDictionary):Void;
	public  function initWithCapacity( numItems:Int):Dynamic;
	public  function keysSortedByValueUsingSelector( comparator:SEL):NSArray;
	public  function allKeysForObject( anObject:Dynamic):NSArray;
	public  function removeAllObjects():Void;
	public  function isEqualToDictionary( otherDictionary:NSDictionary):Bool;
	public  function objectsForKeys( keys:Array<String>,  marker:Dynamic):NSArray;
	public  function objectForKeyedSubscript( key:Dynamic):Dynamic;
	//public  function initWithObjectsAndKeys( firstObject:Dynamic):Dynamic;
	public  function removeObjectsForKeys( keyArray:Array<String>) :Void;
	public  function keysOfEntriesPassingTest( predicate:Dynamic):NSSet;
	public  function enumerateKeysAndObjectsWithOptions( opts:NSEnumerationOptions,  block:Dynamic):Void;
	public  function description():String;
	public  function initWithContentsOfURL (url:NSURL) :NSDictionary;
	public  function keyEnumerator():NSEnumerator;
	public  function writeToFile (path:String, useAuxiliaryFile:Bool) :Bool;
	public  function allValues() :Array<Dynamic>;
	public  function writeToURL (url:NSURL, atomically:Bool) :Bool;
	public  function removeObjectForKey (aKey:String) :Void;
	public  function keysOfEntriesWithOptions (opts:NSEnumerationOptions, predicate:Dynamic) :NSSet;
	public  function descriptionWithLocale (locale:Dynamic) :String;
	//@:overload !!NEED CUSTOM META DATA !!
	//public  function descriptionWithLocale1 (locale:Dynamic, level:Int) :String;
}

