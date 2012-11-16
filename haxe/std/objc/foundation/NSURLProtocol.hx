package objc.foundation;


extern class NSURLProtocol
{

	//Constants

	//Static Methods
	public  function requestIsCacheEquivalent( a:NSURLRequest,  b:NSURLRequest):Bool;
	public  function registerClass( protocolClass:Class):Bool;
	public  function canInitWithRequest( request:NSURLRequest):Bool;
	public  function canonicalRequestForRequest( request:NSURLRequest):NSURLRequest;
	public  function propertyForKey( key:String,  request:NSURLRequest):Dynamic;
	public  function setProperty( value:Dynamic,  key:String,  request:NSMutableURLRequest):Void;
	public  function removePropertyForKey( key:String,  request:NSMutableURLRequest):Void;
	public  function unregisterClass( protocolClass:Class):Void;

	//Properties

	//Methods
	public  function startLoading():Void;
	public  function request():NSURLRequest;
	public  function cachedResponse():NSCachedURLResponse;
	public  function stopLoading():Void;
	public  function URLProtocol( protocol:NSURLProtocol,  request:NSURLRequest,  redirectResponse:NSURLResponse):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function URLProtocol1( protocol:NSURLProtocol,  cachedResponse:NSCachedURLResponse):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function URLProtocol2( protocol:NSURLProtocol,  response:NSURLResponse,  policy:NSURLCacheStoragePolicy):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function URLProtocol3( protocol:NSURLProtocol,  data:NSData):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function URLProtocol4( protocol:NSURLProtocol,  error:NSError):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function URLProtocol5( protocol:NSURLProtocol,  challenge:NSURLAuthenticationChallenge):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function URLProtocol6( protocol:NSURLProtocol,  challenge:NSURLAuthenticationChallenge):Void;
	public  function URLProtocolDidFinishLoading( protocol:NSURLProtocol):Void;
	public  function initWithRequest( request:NSURLRequest,  cachedResponse:NSCachedURLResponse,  client:id<NSURLProtocolClient>):Dynamic;
	public  function client():id<NSURLProtocolClient>;
}

