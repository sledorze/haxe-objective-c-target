package objc.foundation;


extern class NSRunLoop
{

	//Constants

	//Static Methods
	public  function mainRunLoop():NSRunLoop;
	public  function currentRunLoop():NSRunLoop;
	public  function cancelPreviousPerformRequestsWithTarget( aTarget:Dynamic,  aSelector:SEL,  anArgument:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function cancelPreviousPerformRequestsWithTarget1( aTarget:Dynamic):Void;

	//Properties

	//Methods
	public  function getCFRunLoop():CFRunLoopRef;
	public  function addTimer( timer:NSTimer,  mode:String):Void;
	public  function configureAsServer( null:10_0,10_5,2_0,2_0):Void;
	public  function removePort( aPort:NSPort,  mode:String):Void;
	public  function run():Void;
	public  function cancelPerformSelector( aSelector:SEL,  target:Dynamic,  arg:Dynamic):Void;
	public  function addPort( aPort:NSPort,  mode:String):Void;
	public  function limitDateForMode( mode:String):Date;
	public  function acceptInputForMode( mode:String,  limitDate:Date):Void;
	public  function cancelPerformSelectorsWithTarget( target:Dynamic):Void;
	public  function currentMode():String;
	public  function runMode( mode:String,  limitDate:Date):Bool;
	public  function runUntilDate( limitDate:Date):Void;
	public  function performSelector( aSelector:SEL,  anArgument:Dynamic,  delay:NSTimeInterval,  modes:NSArray):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function performSelector1( aSelector:SEL,  anArgument:Dynamic,  delay:NSTimeInterval):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function performSelector2( aSelector:SEL,  target:Dynamic,  arg:Dynamic,  order:Int,  modes:NSArray):Void;
}

