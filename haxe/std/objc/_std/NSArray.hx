
extern class NSArray extends NSObject {
	
	public static function array () :NSArray;
	public function initWithArray (array:NSArray) :NSArray;
	public function count () :Int;
}


/****************	Mutable Array		****************/

extern class NSMutableArray extends NSArray {

	public function addObject(anObject:Dynamic) :Void;
	public function insertObject(anObject:Dynamic, atIndex:Int) :Void;
	public function removeLastObject() :Void;
	public function removeObjectAtIndex(index:Int) :Void;
	public function replaceObjectAtIndex(index:Int, withObject:Dynamic) :Void;

}
