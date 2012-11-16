package objc.foundation;


extern class NSCache
{

	//Constants

	//Static Methods

	//Properties

	//Methods
	public  function name():String;
	public  function objectForKey( key:Dynamic):Dynamic;
	public  function removeAllObjects():Void;
	public  function setEvictsObjectsWithDiscardedContent( b:Bool):Void;
	public  function setName( n:String):Void;
	public  function setObject( obj:Dynamic,  key:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function setObject1( obj:Dynamic,  key:Dynamic,  g:Int):Void;
	public  function setTotalCostLimit( lim:Int):Void;
	public  function totalCostLimit():Int;
	public  function setCountLimit( lim:Int):Void;
	public  function setDelegate( d:id<NSCacheDelegate>):Void;
	public  function delegate():id<NSCacheDelegate>;
	public  function countLimit():Int;
	public  function evictsObjectsWithDiscardedContent():Bool;
	public  function removeObjectForKey( key:Dynamic):Void;
	public  function cache( cache:NSCache,  obj:Dynamic):Void;
}

