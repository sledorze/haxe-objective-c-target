package objc.foundation;


extern class NSThread
{

	//Constants

	//Static Methods
	public  function isMainThread():Bool;
	public  function sleepForTimeInterval( ti:NSTimeInterval):Void;
	public  function setThreadPriority( p:Float):Bool;
	public  function currentThread():NSThread;
	public  function isMultiThreaded():Bool;
	public  function exit():Void;
	public  function callStackReturnAddresses():NSArray;
	public  function sleepUntilDate( date:Date):Void;
	public  function mainThread():NSThread;
	public  function detachNewThreadSelector( selector:SEL,  target:Dynamic,  argument:Dynamic):Void;
	public  function threadPriority():Float;
	public  function callStackSymbols():NSArray;

	//Properties

	//Methods
	public  function name():String;
	public  function isMainThread():Bool;
	public  function setThreadPriority( p:Float):Void;
	public  function stackSize():Int;
	public  function isExecuting():Bool;
	public  function isFinished():Bool;
	public  function setName( n:String):Void;
	public  function isCancelled():Bool;
	public  function performSelectorInBackground( aSelector:SEL,  arg:Dynamic):Void;
	public  function start():Void;
	public  function performSelectorOnMainThread( aSelector:SEL,  arg:Dynamic,  wait:Bool,  array:NSArray):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function performSelectorOnMainThread1( aSelector:SEL,  arg:Dynamic,  wait:Bool):Void;
	public  function initWithTarget( target:Dynamic,  selector:SEL,  argument:Dynamic):Dynamic;
	public  function cancel():Void;
	public  function setStackSize( s:Int):Void;
	public  function main():Void;
	public  function threadDictionary():NSMutableDictionary;
	public  function threadPriority():Float;
	public  function init():Dynamic;
	public  function performSelector( aSelector:SEL,  thr:NSThread,  arg:Dynamic,  wait:Bool,  array:NSArray):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function performSelector1( aSelector:SEL,  thr:NSThread,  arg:Dynamic,  wait:Bool):Void;
}
