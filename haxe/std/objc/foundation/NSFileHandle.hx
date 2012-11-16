package objc.foundation;


extern class NSFileHandle, implements NSSecureCoding
{

	//Constants

	//Static Methods
	public  function fileHandleForWritingAtPath( path:String):Dynamic;
	public  function fileHandleWithStandardOutput():Dynamic;
	public  function fileHandleForReadingFromURL( url:NSURL,  error:NSError*):Dynamic;
	public  function fileHandleWithStandardInput():Dynamic;
	public  function fileHandleWithStandardError():Dynamic;
	public  function fileHandleForUpdatingURL( url:NSURL,  error:NSError*):Dynamic;
	public  function pipe():Dynamic;
	public  function fileHandleForReadingAtPath( path:String):Dynamic;
	public  function fileHandleForWritingToURL( url:NSURL,  error:NSError*):Dynamic;
	public  function fileHandleForUpdatingAtPath( path:String):Dynamic;
	public  function fileHandleWithNullDevice():Dynamic;

	//Properties
	public var )(default, default):NSFileHandle;
	public var )(default, default):NSFileHandle;

	//Methods
	public  function readDataToEndOfFile():NSData;
	public  function fileHandleForWriting():NSFileHandle;
	public  function offsetInFile():unsignedlonglong;
	public  function acceptConnectionInBackgroundAndNotifyForModes( modes:NSArray):Void;
	public  function waitForDataInBackgroundAndNotify():Void;
	public  function waitForDataInBackgroundAndNotifyForModes( modes:NSArray):Void;
	public  function readInBackgroundAndNotify():Void;
	public  function initWithFileDescriptor( fd:Int,  closeopt:Bool):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithFileDescriptor1( fd:Int):Dynamic;
	public  function fileDescriptor():Int;
	public  function truncateFileAtOffset( offset:unsignedlonglong):Void;
	public  function readToEndOfFileInBackgroundAndNotifyForModes( modes:NSArray):Void;
	public  function acceptConnectionInBackgroundAndNotify():Void;
	public  function synchronizeFile():Void;
	public  function availableData():NSData;
	public  function readDataOfLength( length:Int):NSData;
	public  function writeData( data:NSData):Void;
	public  function seekToEndOfFile():unsignedlonglong;
	public  function fileHandleForReading():NSFileHandle;
	public  function closeFile():Void;
	public  function readInBackgroundAndNotifyForModes( modes:NSArray):Void;
	public  function readToEndOfFileInBackgroundAndNotify():Void;
	public  function seekToFileOffset( offset:unsignedlonglong):Void;
	public  function init():Dynamic;
}

