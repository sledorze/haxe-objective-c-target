package objc.foundation;
import objc.foundation.NSObject;

private typedef NSEnumerationOptions = Dynamic;
private typedef NSSortOptions = Dynamic;
private typedef NSComparator = Dynamic;

extern class NSSet extends NSObject implements NSCopying implements NSMutableCopying implements NSSecureCoding/* implements NSFastEnumeration*/
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
	public  function setWithArray (array:Array<Dynamic>) :Dynamic;

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
	public  function setByAddingObjectsFromArray( other:Array<Dynamic>) :NSSet;
	public  function intersectSet( otherSet:NSSet):Void;
	public  function addObjectsFromArray( array:Array<Dynamic>) :Void;
	public  function count():Int;
	public  function anyObject():Dynamic;
	public  function enumerateObjectsUsingBlock( block:Dynamic):Void;
	public  function setByAddingObjectsFromSet( other:NSSet):NSSet;
	public  function initWithObjects( objects:Dynamic, cnt:Int):Dynamic;
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
	public  function initWithArray( array:Array<Dynamic>):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithArray1( array:Array<Dynamic>):Dynamic;
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
	public  function allObjects():Array<Dynamic>;
	public  function objectsPassingTest( predicate:Dynamic):NSSet;
	public  function descriptionWithLocale( locale:Dynamic):String;
}

/*	
#import <Foundation/NSObject.h>
#import <Foundation/NSEnumerator.h>

@class Array<>, NSDictionary, NSString;


extern class NSSet extends NSObject implements NSCopying, NSMutableCopying, NSSecureCoding, NSFastEnumeration>

- (NSUInteger)count;
- (id)member:(id)object;
- (NSEnumerator *)objectEnumerator;

}

extern class NSSet (NSExtendedSet)

- (Array<> *)allObjects;
- (id)anyObject;
- (Bool)containsObject:(id)anObject;
- (NSString *)description;
- (NSString *)descriptionWithLocale:(id)locale;
- (Bool)intersectsSet:(NSSet *)otherSet;
- (Bool)isEqualToSet:(NSSet *)otherSet;
- (Bool)isSubsetOfSet:(NSSet *)otherSet;

- (void)makeObjectsPerformSelector:(SEL)aSelector;
- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument;

- (NSSet *)setByAddingObject:(id)anObject NS_AVAILABLE(10_5, 2_0);
- (NSSet *)setByAddingObjectsFromSet:(NSSet *)other NS_AVAILABLE(10_5, 2_0);
- (NSSet *)setByAddingObjectsFromArray:(Array<> *)other NS_AVAILABLE(10_5, 2_0);

#if NS_BLOCKS_AVAILABLE
- (void)enumerateObjectsUsingBlock:(void (^)(id obj, Bool *stop))block NS_AVAILABLE(10_6, 4_0);
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void (^)(id obj, Bool *stop))block NS_AVAILABLE(10_6, 4_0);

- (NSSet *)objectsPassingTest:(Bool (^)(id obj, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
- (NSSet *)objectsWithOptions:(NSEnumerationOptions)opts passingTest:(Bool (^)(id obj, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
#endif

}

extern class NSSet (NSSetCreation)

+ (id)set;
+ (id)setWithObject:(id)object;
+ (id)setWithObjects:(const id [])objects count:(NSUInteger)cnt;
+ (id)setWithObjects:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
+ (id)setWithSet:(NSSet *)set;
+ (id)setWithArray:(Array<> *)array;

- (id)initWithObjects:(const id [])objects count:(NSUInteger)cnt;
- (id)initWithObjects:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithSet:(NSSet *)set;
- (id)initWithSet:(NSSet *)set copyItems:(Bool)flag;
- (id)initWithArray:(Array<> *)array;

}

extern class NSMutableSet extends NSSet

- (void)addObject:(id)object;
- (void)removeObject:(id)object;

}

extern class NSMutableSet (NSExtendedMutableSet)

- (void)addObjectsFromArray:(Array<> *)array;
- (void)intersectSet:(NSSet *)otherSet;
- (void)minusSet:(NSSet *)otherSet;
- (void)removeAllObjects;
- (void)unionSet:(NSSet *)otherSet;

- (void)setSet:(NSSet *)otherSet;

}

extern class NSMutableSet (NSMutableSetCreation)

+ (id)setWithCapacity:(NSUInteger)numItems;
- (id)initWithCapacity:(NSUInteger)numItems;
    
}


extern class NSCountedSet extends NSMutableSet {
    @private
    id _table;
    void *_reserved;
}

- (id)initWithCapacity:(NSUInteger)numItems; // designated initializer

- (id)initWithArray:(Array<> *)array;
- (id)initWithSet:(NSSet *)set;

- (NSUInteger)countForObject:(id)object;

- (NSEnumerator *)objectEnumerator;
- (void)addObject:(id)object;
- (void)removeObject:(id)object;

}

*/