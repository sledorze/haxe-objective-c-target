package objc.foundation;


extern class NSMethodSignature
{

	//Constants

	//Static Methods
	public  function signatureWithObjCTypes( types:constchar):NSMethodSignature;

	//Properties

	//Methods
	public  function isOneway():Bool;
	public  function frameLength():Int;
	public  function numberOfArguments():Int;
	public  function getArgumentTypeAtIndex( idx:Int):constchar;
	public  function methodReturnType():constchar;
	public  function methodReturnLength():Int;
}

