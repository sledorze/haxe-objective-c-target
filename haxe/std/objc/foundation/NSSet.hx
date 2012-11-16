package objc.foundation;
import objc.foundation.NSObject;

private typedef NSEnumerationOptions = Dynamic;
private typedef NSSortOptions = Dynamic;
private typedef NSComparator = Dynamic;

extern class NSSet extends NSObject, implements NSCopying, implements NSMutableCopying, implements NSSecureCoding/*, implements NSFastEnumeration*/
{

	//Constants

	//Static Methods
	public  function set():Dynamic;
	public  function setWithSet( set:NSSet):Dynamic;
	public  function setWithCapacity( numItems:Int):Dynamic;
	public  function setWithObject( object:Dynamic):Dynamic;
	public  function setWithObjects( objects:Dynamic,  cnt:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function setWithObjects1( firstObj:Dynamic):Dynamic;
	public  function setWithArray( array:NSArray):Dynamic;

	//Properties

	//Methods
	public  function member( object:Dynamic):Dynamic;
	public  function makeObjectsPerformSelector( aSelector:SEL):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function makeObjectsPerformSelector1( aSelector:SEL,  argument:Dynamic):Void;
	public  function setByAddingObject( anObject:Dynamic):NSSet;
	public  function intersectsSet( otherSet:NSSet):Bool;
	public  function objectEnumerator():NSEnumerator;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function objectEnumerator1():NSEnumerator;
	public  function setByAddingObjectsFromArray( other:NSArray):NSSet;
	public  function intersectSet( otherSet:NSSet):Void;
	public  function addObjectsFromArray( array:NSArray):Void;
	public  function count():Int;
	public  function anyObject():Dynamic;
	public  function enumerateObjectsUsingBlock( block:Dynamic):Void;
	public  function setByAddingObjectsFromSet( other:NSSet):NSSet;
	public  function initWithObjects( objects:Dynamic,  cnt:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithObjects1( firstObj:Dynamic):Dynamic;
	public  function objectsWithOptions( opts:NSEnumerationOptions,  predicate:Dynamic):NSSet;
	public  function initWithSet( set:NSSet):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithSet1( set:NSSet,  flag:Bool):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithSet2( set:NSSet):Dynamic;
	public  function initWithCapacity( numItems:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithCapacity1( numItems:Int):Dynamic;
	public  function countForObject( object:Dynamic):Int;
	public  function minusSet( otherSet:NSSet):Void;
	public  function removeAllObjects():Void;
	public  function enumerateObjectsWithOptions( opts:NSEnumerationOptions,  block:Dynamic):Void;
	public  function isEqualToSet( otherSet:NSSet):Bool;
	public  function isSubsetOfSet( otherSet:NSSet):Bool;
	public  function initWithArray( array:NSArray):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithArray1( array:NSArray):Dynamic;
	public  function removeObject( object:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function removeObject1( object:Dynamic):Void;
	public  function unionSet( otherSet:NSSet):Void;
	public  function description():String;
	public  function addObject( object:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function addObject1( object:Dynamic):Void;
	public  function setSet( otherSet:NSSet):Void;
	public  function containsObject( anObject:Dynamic):Bool;
	public  function allObjects():NSArray;
	public  function objectsPassingTest( predicate:Dynamic):NSSet;
	public  function descriptionWithLocale( locale:Dynamic):String;
}

