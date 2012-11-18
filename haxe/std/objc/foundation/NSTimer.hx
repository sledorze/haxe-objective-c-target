package objc.foundation;


extern class NSTimer extends NSObject {

	//Constants

	//Static Methods
	public static function timerWithTimeInterval( ti:NSTimeInterval,  invocation:NSInvocation,  yesOrNo:Bool):NSTimer;
	//@:overload !!NEED CUSTOM META DATA !!
	public static function timerWithTimeInterval1( ti:NSTimeInterval,  aTarget:Dynamic,  aSelector:SEL,  userInfo:Dynamic,  yesOrNo:Bool):NSTimer;
	public static function scheduledTimerWithTimeInterval( ti:NSTimeInterval,  invocation:NSInvocation,  yesOrNo:Bool):NSTimer;
	//@:overload !!NEED CUSTOM META DATA !!
	public static function scheduledTimerWithTimeInterval1( ti:NSTimeInterval,  aTarget:Dynamic,  aSelector:SEL,  userInfo:Dynamic,  yesOrNo:Bool):NSTimer;

	//Properties

	//Methods
	public  function initWithFireDate( date:Date,  ti:NSTimeInterval,  t:Dynamic,  s:SEL,  ui:Dynamic,  rep:Bool):Dynamic;
	public  function fire():Void;
	public  function fireDate():Date;
	public  function setFireDate( date:Date):Void;
	public  function userInfo():Dynamic;
	public  function timeInterval():NSTimeInterval;
	public  function invalidate():Void;
	public  function isValid():Bool;
}

