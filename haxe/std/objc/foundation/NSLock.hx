package objc.foundation;


extern class NSLock, implements NSLocking
{

	//Constants

	//Static Methods

	//Properties

	//Methods
	public  function name():String;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function name1():String;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function name2():String;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function name3():String;
	public  function broadcast():Void;
	public  function waitUntilDate( limit:Date):Bool;
	public  function tryLock():Bool;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function tryLock1():Bool;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function tryLock2():Bool;
	public  function lockBeforeDate( limit:Date):Bool;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function lockBeforeDate1( limit:Date):Bool;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function lockBeforeDate2( limit:Date):Bool;
	public  function lockWhenCondition( condition:Int):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function lockWhenCondition1( condition:Int,  limit:Date):Bool;
	public  function lock():Void;
	public  function setName( n:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function setName1( n:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function setName2( n:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function setName3( n:String):Void;
	public  function unlockWithCondition( condition:Int):Void;
	public  function tryLockWhenCondition( condition:Int):Bool;
	public  function wait():Void;
	public  function signal():Void;
	public  function condition():Int;
	public  function unlock():Void;
	public  function initWithCondition( condition:Int):Dynamic;
}

