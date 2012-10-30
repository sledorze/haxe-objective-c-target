package objc.foundation;

extern class NSArray extends NSObject {
	
	public static function array () :NSArray;
	public static function arrayWithArray (a:NSArray) :NSArray;
	public function initWithArray (array:NSArray) :NSArray;
	public function count () :Int;
	public function componentsJoinedByString (sep:String) :String;
	public function lastObject () :Dynamic;
	public function containsObject (anObject:Dynamic) :Bool;
	public function objectAtIndex (index:Int) :Dynamic;
	public function subarrayWithRange (range:NSRange) :NSMutableArray;
	public function arrayByAddingObjectsFromArray (otherArray:NSArray) :NSMutableArray;
}


/****************	Mutable Array		****************/

extern class NSMutableArray extends NSArray {

	public static function arrayWithArray (a:NSMutableArray) :NSMutableArray;
	public function addObject(anObject:Dynamic) :Void;
	public function insertObject(anObject:Dynamic, atIndex:Int) :Void;
	public function removeObject(anObject:Dynamic) :Void;
	public function removeLastObject() :Void;
	public function removeObjectAtIndex(index:Int) :Void;
	public function replaceObjectAtIndex(index:Int, withObject:Dynamic) :Void;
	public function removeObjectsInRange(aRange:NSRange) :Void;
	public function removeObjectsInArray(array:NSArray) :Void;
}
