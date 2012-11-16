package objc.foundation;


extern class NSString extends NSObject {

	//Constants

	//Static Methods
	public static function pathWithComponents (components:NSArray) :String;

	//Properties

	//Methods
	public  function completePathIntoString( outputName:NSString,  flag:Bool,  outputArray:NSArray,  filterTypes:NSArray):Int;
	public  function isAbsolutePath():Bool;
	public  function stringByDeletingLastPathComponent():String;
	public  function stringByAppendingPathExtension (str:String) :String;
	//public  function getFileSystemRepresentation( cname:String, max:Int):Bool;
	public  function lastPathComponent():String;
	public  function stringByAbbreviatingWithTildeInPath():String;
	public  function stringByResolvingSymlinksInPath():String;
	public  function stringByAppendingPathComponent(str:String):String;
	public  function pathComponents():NSArray;
	public  function stringsByAppendingPaths( paths:NSArray):NSArray;
	public  function pathsMatchingExtensions( filterTypes:NSArray):NSArray;
	public  function pathExtension():String;
	public  function stringByDeletingPathExtension():String;
	public  function stringByExpandingTildeInPath():String;
	public  function fileSystemRepresentation():String;
	public  function stringByStandardizingPath():String;
	
	public function intValue () :Int;
	public function floatValue () :Int;
}

extern enum NSSearchPathDirectory
{
	NSApplicationDirectory;
	NSDemoApplicationDirectory;
	NSDeveloperApplicationDirectory;
	NSAdminApplicationDirectory;
	NSLibraryDirectory;
	NSDeveloperDirectory;
	NSUserDirectory;
	NSDocumentationDirectory;
	NSDocumentDirectory;
	NSCoreServiceDirectory;
	NSAutosavedInformationDirectory;
/*	4_0;
	NSDesktopDirectory;
	NSCachesDirectory;
	NSApplicationSupportDirectory;
	NSDownloadsDirectory;
	2_0;
	NSInputMethodsDirectory;
	4_0;
	NSMoviesDirectory;
	4_0;
	NSMusicDirectory;
	4_0;
	NSPicturesDirectory;
	4_0;
	NSPrinterDescriptionDirectory;
	4_0;
	NSSharedPublicDirectory;
	4_0;
	NSPreferencePanesDirectory;
	4_0;
	NSApplicationScriptsDirectory;
	NA;
	NSItemReplacementDirectory;
	4_0;
	NSAllApplicationsDirectory;
	NSAllLibrariesDirectory;
	NSTrashDirectory;
	NA;*/
}

extern enum NSSearchPathDomainMask
{
	NSUserDomainMask;
	NSLocalDomainMask;
	NSNetworkDomainMask;
	NSSystemDomainMask;
	NSAllDomainsMask;
}

