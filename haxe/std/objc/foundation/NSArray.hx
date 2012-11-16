package objc.foundation;

import objc.foundation.NSObject;

private typedef NSEnumerationOptions = Dynamic;
private typedef NSSortOptions = Dynamic;
private typedef NSComparator = Dynamic;

extern class NSArray extends NSObject, implements NSCopying, implements NSMutableCopying/*, implements NSSecureCoding, implements NSFastEnumeration*/
{

	//Constants

	//Static Methods
	public static function arrayWithArray( array:NSArray):Dynamic;
	public static function arrayWithContentsOfURL( url:NSURL):Dynamic;
	public static function arrayWithObjects( objects:Dynamic,  cnt:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public static function arrayWithObjects1( firstObj:Dynamic):Dynamic;
	public static function arrayWithObject( anObject:Dynamic):Dynamic;
	public static function array():NSArray;
	public static function arrayWithContentsOfFile( path:String):Dynamic;

	//Properties

	//Methods
	public  function enumerateObjectsAtIndexes( s:NSIndexSet,  opts:NSEnumerationOptions,  block:Dynamic):Void;
	public  function objectAtIndexedSubscript( idx:Int):Dynamic;
	public  function replaceObjectAtIndex( index:Int,  anObject:Dynamic):Void;
	public  function lastObject():Dynamic;
	public  function sortedArrayHint():NSData;
	public  function indexesOfObjectsWithOptions( opts:NSEnumerationOptions,  predicate:Dynamic):NSIndexSet;
	public  function initWithContentsOfFile( path:String):Dynamic;
	public  function objectAtIndex( index:Int):Dynamic;
	public  function removeObjectsInRange( range:NSRange):Void;
	public  function initWithObjects( objects:Dynamic,  cnt:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithObjects1( firstObj:Dynamic):Dynamic;
	public  function sortedArrayWithOptions( opts:NSSortOptions,  cmptr:NSComparator):NSArray;
	public  function indexesOfObjectsPassingTest( predicate:Dynamic):NSIndexSet;
	public  function componentsJoinedByString( separator:String):String;
	public  function arrayByAddingObjectsFromArray( otherArray:NSArray):NSArray;
	public  function indexOfObjectIdenticalTo( anObject:Dynamic):Int;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function indexOfObjectIdenticalTo1( anObject:Dynamic,  range:NSRange):Int;
	public  function enumerateObjectsWithOptions( opts:NSEnumerationOptions,  block:Dynamic):Void;
	public  function indexOfObjectAtIndexes( s:NSIndexSet,  opts:NSEnumerationOptions,  predicate:Dynamic):Int;
	public  function removeObject( anObject:Dynamic,  range:NSRange):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function removeObject1( anObject:Dynamic):Void;
	public  function description():String;
	public  function initWithContentsOfURL( url:NSURL):Dynamic;
	public  function arrayByAddingObject( anObject:Dynamic):NSArray;
	public  function sortedArrayUsingFunction( comparator:Int->Dynamic->Dynamic->Void,  context:Dynamic):NSArray;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function sortedArrayUsingFunction1( comparator:Int->Dynamic->Dynamic->Void,  context:Dynamic,  hint:NSData):NSArray;
	public  function addObject( anObject:Dynamic):Void;
	public  function insertObject( anObject:Dynamic,  index:Int):Void;
	public  function writeToURL( url:NSURL,  atomically:Bool):Bool;
	public  function objectsAtIndexes( indexes:NSIndexSet):NSArray;
	public  function sortedArrayUsingSelector( comparator:SEL):NSArray;
	public  function descriptionWithLocale( locale:Dynamic):String;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function descriptionWithLocale1( locale:Dynamic,  level:Int):String;
	public  function makeObjectsPerformSelector( aSelector:SEL):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function makeObjectsPerformSelector1( aSelector:SEL,  argument:Dynamic):Void;
	public  function indexOfObjectWithOptions( opts:NSEnumerationOptions,  predicate:Dynamic):Int;
	public  function objectEnumerator():NSEnumerator;
	public  function count():Int;
	public  function enumerateObjectsUsingBlock( block:Dynamic):Void;
	public  function getObjects( objects:Dynamic,  range:NSRange):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function getObjects1( objects:Dynamic):Void;
	public  function isEqualToArray( otherArray:NSArray):Bool;
	public  function initWithArray( array:NSArray):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithArray1( array:NSArray,  flag:Bool):Dynamic;
	public  function sortedArrayUsingComparator( cmptr:NSComparator):NSArray;
	public  function indexOfObject( anObject:Dynamic):Int;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function indexOfObject1( anObject:Dynamic,  range:NSRange):Int;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function indexOfObject2( obj:Dynamic,  r:NSRange,  opts:NSBinarySearchingOptions,  cmp:NSComparator):Int;
	public  function indexesOfObjectsAtIndexes( s:NSIndexSet,  opts:NSEnumerationOptions,  predicate:Dynamic):NSIndexSet;
	public  function firstObjectCommonWithArray( otherArray:NSArray):Dynamic;
	public  function subarrayWithRange( range:NSRange):NSMutableArray;
	public  function writeToFile( path:String,  useAuxiliaryFile:Bool):Bool;
	public  function reverseObjectEnumerator():NSEnumerator;
	public  function indexOfObjectPassingTest( predicate:Dynamic):Int;
	public  function containsObject( anObject:Dynamic):Bool;
	public  function removeObjectsInArray( otherArray:NSArray):Void;
}

extern enum NSBinarySearchingOptions
{
	NSBinarySearchingFirstEqual;
	NSBinarySearchingLastEqual;
	NSBinarySearchingInsertionIndex;
}

/****************	Mutable Array		****************/

extern class NSMutableArray extends NSArray {

	public static function arrayWithArray (a:NSMutableArray) :NSMutableArray;
	public static function arrayWithCapacity( numItems:Int):Dynamic;

	public function initWithCapacity( numItems:Int):Dynamic;
	public function addObject(anObject:Dynamic) :Void;
	public function insertObject(anObject:Dynamic, atIndex:Int) :Void;
	public function removeLastObject() :Void;
	public function removeObjectAtIndex(index:Int) :Void;
	public function replaceObjectAtIndex(index:Int, withObject:Dynamic) :Void;
	
	// NSExtendedMutableArray
	public function addObjectsFromArray(otherArray:NSArray) :Void;
	public function exchangeObjectAtIndex(idx1:Int, withObjectAtIndex:Int) :Void;
	public function removeAllObjects():Void;
	public function removeObject(anObject:Dynamic) :Void;
	//@:overload public function removeObject(anObject:Dynamic, inRange:NSRange) :Void;
	public function removeObjectsInRange(range:NSRange) :Void;
	public function removeObjectsInArray(otherArray:NSArray) :Void;
	public function removeObjectIdenticalTo(anObject:Dynamic, inRange:NSRange) :Void;
	//@:overload public function removeObjectIdenticalTo(anObject:Dynamic) :Void;
	public function replaceObjectsInRange(range:NSRange, withObjectsFromArray:NSArray, range:NSRange):Void;
	//@:overload public function replaceObjectsInRange(range:NSRange, withObjectsFromArray:NSArray):Void;
	public function setArray(otherArray:NSArray):Void;
	public function sortUsingFunction( compare:Dynamic->Dynamic->Int,  context:Dynamic):Void;
	public function insertObjects(objects:NSArray, atIndexes:NSIndexSet):Void;
	public function sortUsingSelector(comparator:SEL):Void;
	public function removeObjectsAtIndexes(indexes:NSIndexSet):Void;
	public function replaceObjectsAtIndexes(indexes:NSIndexSet, withObjects:NSArray):Void;
	public function setObject(obj:Dynamic, atIndexedSubscript:Int):Void;

	public function sortUsingComparator(cmptr:NSComparator):Void;
	public function sortWithOptions(opts:NSSortOptions, usingComparator:NSComparator):Void;
}
