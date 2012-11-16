package objc.foundation;


extern class NSNotificationQueue
{

	//Constants

	//Static Methods
	public  function defaultQueue():Dynamic;

	//Properties

	//Methods
	public  function enqueueNotification( notification:NSNotification,  postingStyle:NSPostingStyle):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function enqueueNotification1( notification:NSNotification,  postingStyle:NSPostingStyle,  coalesceMask:Int,  modes:NSArray):Void;
	public  function dequeueNotificationsMatching( notification:NSNotification,  coalesceMask:Int):Void;
	public  function initWithNotificationCenter( notificationCenter:NSNotificationCenter):Dynamic;
}

extern enum NSPostingStyle
{
	NSPostWhenIdle;
	NSPostASAP;
	NSPostNow;
}

extern enum NSNotificationCoalescing
{
	NSNotificationNoCoalescing;
	NSNotificationCoalescingOnName;
	NSNotificationCoalescingOnSender;
}

