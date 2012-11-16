package objc.foundation;


extern class NSDictionary, implements NSCopying, implements NSMutableCopying, implements NSSecureCoding, implements NSFastEnumeration
{

	//Constants

	//Static Methods
	public  function dictionaryWithObject( object:Dynamic,  key:id<NSCopying>):Dynamic;
	public  function dictionaryWithContentsOfFile( path:String):Dynamic;
	public  function sharedKeySetForKeys( keys:NSArray):Dynamic;
	public  function dictionaryWithContentsOfURL( url:NSURL):Dynamic;
	public  function dictionaryWithObjects( objects:constid[],  keys:constid[],  cnt:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function dictionaryWithObjects1( objects:constid[],  keys:constid<NSCopying>[],  cnt:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function dictionaryWithObjects2( objects:NSArray,  keys:NSArray):Dynamic;
	public  function dictionaryWithDictionary( dict:NSDictionary):Dynamic;
	public  function dictionaryWithSharedKeySet( keyset:Dynamic):Dynamic;
	public  function dictionary():Dynamic;
	public  function dictionaryWithObjectsAndKeys( firstObject:Dynamic):Dynamic;
	public  function dictionaryWithCapacity( numItems:Int):Dynamic;

	//Properties

	//Methods
	public  function objectForKey( aKey:Dynamic):Dynamic;
	public  function enumerateKeysAndObjectsUsingBlock( block:Dynamic):Void;
	public  function addEntriesFromDictionary( otherDictionary:NSDictionary):Void;
	public  function descriptionInStringsFileFormat():String;
	public  function keysSortedByValueUsingComparator( cmptr:NSComparator):NSArray;
	public  function objectEnumerator():NSEnumerator;
	public  function keysSortedByValueWithOptions( opts:NSSortOptions,  cmptr:NSComparator):NSArray;
	public  function initWithContentsOfFile( path:String):Dynamic;
	public  function setObject( anObject:Dynamic,  aKey:id<NSCopying>):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function setObject1( obj:Dynamic,  key:id<NSCopying>):Void;
	public  function initWithDictionary( otherDictionary:NSDictionary):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithDictionary1( otherDictionary:NSDictionary,  flag:Bool):Dynamic;
	public  function count():Int;
	public  function getObjects( objects:Dynamic,  keys:Dynamic):Void;
	public  function initWithObjects( objects:constid[],  keys:constid[],  cnt:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithObjects1( objects:constid[],  keys:constid<NSCopying>[],  cnt:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithObjects2( objects:NSArray,  keys:NSArray):Dynamic;
	public  function allKeys():NSArray;
	public  function setDictionary( otherDictionary:NSDictionary):Void;
	public  function initWithCapacity( numItems:Int):Dynamic;
	public  function keysSortedByValueUsingSelector( comparator:SEL):NSArray;
	public  function allKeysForObject( anObject:Dynamic):NSArray;
	public  function removeAllObjects():Void;
	public  function isEqualToDictionary( otherDictionary:NSDictionary):Bool;
	public  function objectsForKeys( keys:NSArray,  marker:Dynamic):NSArray;
	public  function objectForKeyedSubscript( key:Dynamic):Dynamic;
	public  function initWithObjectsAndKeys( firstObject:Dynamic):Dynamic;
	public  function removeObjectsForKeys( keyArray:NSArray):Void;
	public  function keysOfEntriesPassingTest( predicate:Dynamic):NSSet;
	public  function enumerateKeysAndObjectsWithOptions( opts:NSEnumerationOptions,  block:Dynamic):Void;
	public  function description():String;
	public  function initWithContentsOfURL( url:NSURL):Dynamic;
	public  function keyEnumerator():NSEnumerator;
	public  function writeToFile( path:String,  useAuxiliaryFile:Bool):Bool;
	public  function allValues():NSArray;
	public  function writeToURL( url:NSURL,  atomically:Bool):Bool;
	public  function removeObjectForKey( aKey:Dynamic):Void;
	public  function keysOfEntriesWithOptions( opts:NSEnumerationOptions,  predicate:Dynamic):NSSet;
	public  function descriptionWithLocale( locale:Dynamic):String;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function descriptionWithLocale1( locale:Dynamic,  level:Int):String;
}

