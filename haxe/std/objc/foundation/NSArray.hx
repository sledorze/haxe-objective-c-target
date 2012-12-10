package objc.foundation;

import objc.foundation.NSObject;

private typedef NSEnumerationOptions = Dynamic;
private typedef NSSortOptions = Dynamic;
private typedef NSComparator = Dynamic;

extern class Array<> extends NSObject, implements NSCopying, implements NSMutableCopying/*, implements NSSecureCoding, implements NSFastEnumeration*/
{

	//Constants

	//Static Methods
	public static function arrayWithArray( array:Array<>):Dynamic;
	public static function arrayWithContentsOfURL( url:NSURL):Dynamic;
	public static function arrayWithObjects( objects:Dynamic,  cnt:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public static function arrayWithObjects1( firstObj:Dynamic):Dynamic;
	public static function arrayWithObject( anObject:Dynamic):Dynamic;
	public static function array():Array<>;
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
	public  function sortedArrayWithOptions( opts:NSSortOptions,  cmptr:NSComparator):Array<>;
	public  function indexesOfObjectsPassingTest( predicate:Dynamic):NSIndexSet;
	public  function componentsJoinedByString( separator:String):String;
	public  function arrayByAddingObjectsFromArray( otherArray:Array<>):Array<>;
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
	public  function arrayByAddingObject( anObject:Dynamic):Array<>;
	public  function sortedArrayUsingFunction( comparator:Int->Dynamic->Dynamic->Void,  context:Dynamic):Array<>;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function sortedArrayUsingFunction1( comparator:Int->Dynamic->Dynamic->Void,  context:Dynamic,  hint:NSData):Array<>;
	public  function addObject( anObject:Dynamic):Void;
	public  function insertObject( anObject:Dynamic,  index:Int):Void;
	public  function writeToURL( url:NSURL,  atomically:Bool):Bool;
	public  function objectsAtIndexes( indexes:NSIndexSet):Array<>;
	public  function sortedArrayUsingSelector( comparator:SEL):Array<>;
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
	public  function isEqualToArray( otherArray:Array<>):Bool;
	public  function initWithArray( array:Array<>):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithArray1( array:Array<>,  flag:Bool):Dynamic;
	public  function sortedArrayUsingComparator( cmptr:NSComparator):Array<>;
	public  function indexOfObject( anObject:Dynamic):Int;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function indexOfObject1( anObject:Dynamic,  range:NSRange):Int;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function indexOfObject2( obj:Dynamic,  r:NSRange,  opts:NSBinarySearchingOptions,  cmp:NSComparator):Int;
	public  function indexesOfObjectsAtIndexes( s:NSIndexSet,  opts:NSEnumerationOptions,  predicate:Dynamic):NSIndexSet;
	public  function firstObjectCommonWithArray( otherArray:Array<>):Dynamic;
	public  function subarrayWithRange( range:NSRange):NSMutableArray;
	public  function writeToFile( path:String,  useAuxiliaryFile:Bool):Bool;
	public  function reverseObjectEnumerator():NSEnumerator;
	public  function indexOfObjectPassingTest( predicate:Dynamic):Int;
	public  function containsObject( anObject:Dynamic):Bool;
	public  function removeObjectsInArray( otherArray:Array<>):Void;
}

extern enum NSBinarySearchingOptions
{
	NSBinarySearchingFirstEqual;
	NSBinarySearchingLastEqual;
	NSBinarySearchingInsertionIndex;
}

/****************	Mutable Array		****************/

extern class NSMutableArray extends Array<> {

	public static function arrayWithArray (a:NSMutableArray) :NSMutableArray;
	public static function arrayWithCapacity( numItems:Int):Dynamic;

	public function initWithCapacity( numItems:Int):Dynamic;
	public function addObject(anObject:Dynamic) :Void;
	public function insertObject(anObject:Dynamic, atIndex:Int) :Void;
	public function removeLastObject() :Void;
	public function removeObjectAtIndex(index:Int) :Void;
	public function replaceObjectAtIndex(index:Int, withObject:Dynamic) :Void;
	
	// NSExtendedMutableArray
	public function addObjectsFromArray(otherArray:Array<>) :Void;
	public function exchangeObjectAtIndex(idx1:Int, withObjectAtIndex:Int) :Void;
	public function removeAllObjects():Void;
	public function removeObject(anObject:Dynamic) :Void;
	//@:overload public function removeObject(anObject:Dynamic, inRange:NSRange) :Void;
	public function removeObjectsInRange(range:NSRange) :Void;
	public function removeObjectsInArray(otherArray:Array<>) :Void;
	public function removeObjectIdenticalTo(anObject:Dynamic, inRange:NSRange) :Void;
	//@:overload public function removeObjectIdenticalTo(anObject:Dynamic) :Void;
	public function replaceObjectsInRange(range:NSRange, withObjectsFromArray:Array<>, range:NSRange):Void;
	//@:overload public function replaceObjectsInRange(range:NSRange, withObjectsFromArray:Array<>):Void;
	public function setArray(otherArray:Array<>):Void;
	public function sortUsingFunction( compare:Dynamic->Dynamic->Int,  context:Dynamic):Void;
	public function insertObjects(objects:Array<>, atIndexes:NSIndexSet):Void;
	public function sortUsingSelector(comparator:SEL):Void;
	public function removeObjectsAtIndexes(indexes:NSIndexSet):Void;
	public function replaceObjectsAtIndexes(indexes:NSIndexSet, withObjects:Array<>):Void;
	public function setObject(obj:Dynamic, atIndexedSubscript:Int):Void;

	public function sortUsingComparator(cmptr:NSComparator):Void;
	public function sortWithOptions(opts:NSSortOptions, usingComparator:NSComparator):Void;
}


/*
extern class Array<> extends NSObject, implements NSCopying, NSMutableCopying, NSSecureCoding, NSFastEnumeration>

- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;
    
}

extern class Array<> (NSExtendedArray)

- (Array<> *)arrayByAddingObject:(id)anObject;
- (Array<> *)arrayByAddingObjectsFromArray:(Array<> *)otherArray;
- (NSString *)componentsJoinedByString:(NSString *)separator;
- (Bool)containsObject:(id)anObject;
- (NSString *)description;
- (NSString *)descriptionWithLocale:(id)locale;
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
- (id)firstObjectCommonWithArray:(Array<> *)otherArray;
- (void)getObjects:(id __unsafe_unretained [])objects range:(NSRange)range;
- (NSUInteger)indexOfObject:(id)anObject;
- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range;
- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject;
- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject inRange:(NSRange)range;
- (Bool)isEqualToArray:(Array<> *)otherArray;
- (id)lastObject;
- (NSEnumerator *)objectEnumerator;
- (NSEnumerator *)reverseObjectEnumerator;
- (NSData *)sortedArrayHint;
- (Array<> *)sortedArrayUsingFunction:(NSInteger (*)(id, id, void *))comparator context:(void *)context;
- (Array<> *)sortedArrayUsingFunction:(NSInteger (*)(id, id, void *))comparator context:(void *)context hint:(NSData *)hint;
- (Array<> *)sortedArrayUsingSelector:(SEL)comparator;
- (Array<> *)subarrayWithRange:(NSRange)range;
- (Bool)writeToFile:(NSString *)path atomically:(Bool)useAuxiliaryFile;
- (Bool)writeToURL:(NSURL *)url atomically:(Bool)atomically;

- (void)makeObjectsPerformSelector:(SEL)aSelector;
- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument;

- (Array<> *)objectsAtIndexes:(NSIndexSet *)indexes;

- (id)objectAtIndexedSubscript:(NSUInteger)idx NS_AVAILABLE(10_8, 6_0);

#if NS_BLOCKS_AVAILABLE
- (void)enumerateObjectsUsingBlock:(void (^)(id obj, NSUInteger idx, Bool *stop))block NS_AVAILABLE(10_6, 4_0);
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void (^)(id obj, NSUInteger idx, Bool *stop))block NS_AVAILABLE(10_6, 4_0);
- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void (^)(id obj, NSUInteger idx, Bool *stop))block NS_AVAILABLE(10_6, 4_0);

- (NSUInteger)indexOfObjectPassingTest:(Bool (^)(id obj, NSUInteger idx, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
- (NSUInteger)indexOfObjectWithOptions:(NSEnumerationOptions)opts passingTest:(Bool (^)(id obj, NSUInteger idx, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
- (NSUInteger)indexOfObjectAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(Bool (^)(id obj, NSUInteger idx, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);

- (NSIndexSet *)indexesOfObjectsPassingTest:(Bool (^)(id obj, NSUInteger idx, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
- (NSIndexSet *)indexesOfObjectsWithOptions:(NSEnumerationOptions)opts passingTest:(Bool (^)(id obj, NSUInteger idx, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
- (NSIndexSet *)indexesOfObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(Bool (^)(id obj, NSUInteger idx, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);

- (Array<> *)sortedArrayUsingComparator:(NSComparator)cmptr NS_AVAILABLE(10_6, 4_0);
- (Array<> *)sortedArrayWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr NS_AVAILABLE(10_6, 4_0);

typedef NS_OPTIONS(NSUInteger, NSBinarySearchingOptions) {
	NSBinarySearchingFirstEqual = (1UL << 8),
	NSBinarySearchingLastEqual = (1UL << 9),
	NSBinarySearchingInsertionIndex = (1UL << 10),
};

- (NSUInteger)indexOfObject:(id)obj inSortedRange:(NSRange)r options:(NSBinarySearchingOptions)opts usingComparator:(NSComparator)cmp NS_AVAILABLE(10_6, 4_0); // binary search

#endif

}

extern class Array<> (Array<>Creation)

+ (id)array;
+ (id)arrayWithObject:(id)anObject;
+ (id)arrayWithObjects:(const id [])objects count:(NSUInteger)cnt;
+ (id)arrayWithObjects:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
+ (id)arrayWithArray:(Array<> *)array;

- (id)initWithObjects:(const id [])objects count:(NSUInteger)cnt;
- (id)initWithObjects:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithArray:(Array<> *)array;
- (id)initWithArray:(Array<> *)array copyItems:(Bool)flag;

+ (id)arrayWithContentsOfFile:(NSString *)path;
+ (id)arrayWithContentsOfURL:(NSURL *)url;
- (id)initWithContentsOfFile:(NSString *)path;
- (id)initWithContentsOfURL:(NSURL *)url;

}

extern class Array<> (NSDeprecated)


- (void)getObjects:(id __unsafe_unretained [])objects;

}


extern class NSMutableArray : Array<>

- (void)addObject:(id)anObject;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

}

extern class NSMutableArray (NSExtendedMutableArray)
    
- (void)addObjectsFromArray:(Array<> *)otherArray;
- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
- (void)removeAllObjects;
- (void)removeObject:(id)anObject inRange:(NSRange)range;
- (void)removeObject:(id)anObject;
- (void)removeObjectIdenticalTo:(id)anObject inRange:(NSRange)range;
- (void)removeObjectIdenticalTo:(id)anObject;
- (void)removeObjectsFromIndices:(NSUInteger *)indices numIndices:(NSUInteger)cnt NS_DEPRECATED(10_0, 10_6, 2_0, 4_0);
- (void)removeObjectsInArray:(Array<> *)otherArray;
- (void)removeObjectsInRange:(NSRange)range;
- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(Array<> *)otherArray range:(NSRange)otherRange;
- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(Array<> *)otherArray;
- (void)setArray:(Array<> *)otherArray;
- (void)sortUsingFunction:(NSInteger (*)(id, id, void *))compare context:(void *)context;
- (void)sortUsingSelector:(SEL)comparator;

- (void)insertObjects:(Array<> *)objects atIndexes:(NSIndexSet *)indexes;
- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(Array<> *)objects;

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx NS_AVAILABLE(10_8, 6_0);

#if NS_BLOCKS_AVAILABLE
- (void)sortUsingComparator:(NSComparator)cmptr NS_AVAILABLE(10_6, 4_0);
- (void)sortWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr NS_AVAILABLE(10_6, 4_0);
#endif

}

extern class NSMutableArray (NSMutableArrayCreation)

+ (id)arrayWithCapacity:(NSUInteger)numItems;
- (id)initWithCapacity:(NSUInteger)numItems;

}

*/