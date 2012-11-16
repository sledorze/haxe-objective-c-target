package objc.foundation;


extern class NSURLResponse, implements NSCoding, implements NSCopying
{

	//Constants

	//Static Methods
	public  function localizedStringForStatusCode( statusCode:Int):String;

	//Properties

	//Methods
	public  function statusCode():Int;
	public  function MIMEType():String;
	public  function suggestedFilename():String;
	public  function initWithURL( URL:NSURL,  MIMEType:String,  length:Int,  name:String):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithURL1( url:NSURL,  statusCode:Int,  HTTPVersion:String,  headerFields:NSDictionary):Dynamic;
	public  function textEncodingName():String;
	public  function URL():NSURL;
	public  function expectedContentLength():longlong;
	public  function allHeaderFields():NSDictionary;
}

