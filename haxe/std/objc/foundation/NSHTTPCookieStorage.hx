package objc.foundation;


extern class NSHTTPCookieStorage
{

	//Constants
	static public inline var null:NSHTTPCookieManagerAcceptPolicyChangedNotification;
	static public inline var null:NSHTTPCookieManagerCookiesChangedNotification;

	//Static Methods
	public  function sharedHTTPCookieStorage():NSHTTPCookieStorage;

	//Properties

	//Methods
	public  function cookies():NSArray;
	public  function setCookies( cookies:NSArray,  URL:NSURL,  mainDocumentURL:NSURL):Void;
	public  function setCookieAcceptPolicy( cookieAcceptPolicy:NSHTTPCookieAcceptPolicy):Void;
	public  function deleteCookie( cookie:NSHTTPCookie):Void;
	public  function cookieAcceptPolicy():NSHTTPCookieAcceptPolicy;
	public  function sortedCookiesUsingDescriptors( sortOrder:NSArray):NSArray;
	public  function setCookie( cookie:NSHTTPCookie):Void;
	public  function cookiesForURL( URL:NSURL):NSArray;
}

extern enum NSHTTPCookieAcceptPolicy
{
	NSHTTPCookieAcceptPolicyAlways;
	NSHTTPCookieAcceptPolicyNever;
	NSHTTPCookieAcceptPolicyOnlyFromMainDocumentDomain;
}

