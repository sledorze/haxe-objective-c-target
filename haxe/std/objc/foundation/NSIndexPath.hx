package objc.foundation;


extern class NSIndexPath, implements NSCopying, implements NSCoding
{

	//Constants

	//Static Methods
	public  function indexPathWithIndexes( indexes:constInt[],  length:Int):Dynamic;
	public  function indexPathWithIndex( index:Int):Dynamic;

	//Properties

	//Methods
	public  function initWithIndexes( indexes:constInt[],  length:Int):Dynamic;
	public  function indexPathByRemovingLastIndex():NSIndexPath;
	public  function initWithIndex( index:Int):Dynamic;
	public  function indexPathByAddingIndex( index:Int):NSIndexPath;
	public  function length():Int;
	public  function getIndexes( indexes:Int):Void;
	public  function compare( otherObject:NSIndexPath):NSComparisonResult;
	public  function indexAtPosition( position:Int):Int;
}

