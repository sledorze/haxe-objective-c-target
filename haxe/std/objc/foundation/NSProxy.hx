package objc.foundation;


extern class NSProxy implements NSObject
{

	//Constants

	//Static Methods
	public  function allocWithZone( zone:NSZone):Dynamic;
	public  function respondsToSelector( aSelector:SEL):Bool;
	public  function alloc():Dynamic;
	public  function class():Class;

	//Properties

	//Methods
	public  function methodSignatureForSelector( sel:SEL):NSMethodSignature;
	public  function retainWeakReference():Bool;
	public  function forwardInvocation( invocation:NSInvocation):Void;
	public  function debugDescription():String;
	public  function dealloc():Void;
	public  function finalize():Void;
	public  function description():String;
	public  function allowsWeakReference():Bool;
}

