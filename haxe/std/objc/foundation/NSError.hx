package objc.foundation;


extern class NSError, implements NSCopying, implements NSSecureCoding
{

	//Constants

	//Static Methods
	public  function errorWithDomain( domain:String,  code:Int,  dict:NSDictionary):Dynamic;

	//Properties

	//Methods
	public  function recoveryAttempter():Dynamic;
	public  function localizedFailureReason():String;
	public  function initWithDomain( domain:String,  code:Int,  dict:NSDictionary):Dynamic;
	public  function userInfo():NSDictionary;
	public  function localizedDescription():String;
	public  function domain():String;
	public  function code():Int;
	public  function localizedRecoverySuggestion():String;
	public  function attemptRecoveryFromError( error:NSError,  recoveryOptionIndex:Int,  delegate:Dynamic,  didRecoverSelector:SEL,  contextInfo:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function attemptRecoveryFromError1( error:NSError,  recoveryOptionIndex:Int):Bool;
	public  function localizedRecoveryOptions():NSArray;
	public  function helpAnchor():String;
}

