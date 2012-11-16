package objc.foundation;


extern class NSFileVersion
{

	//Constants

	//Static Methods
	public  function otherVersionsOfItemAtURL( url:NSURL):NSArray;
	public  function currentVersionOfItemAtURL( url:NSURL):NSFileVersion;
	public  function addVersionOfItemAtURL( url:NSURL,  contentsURL:NSURL,  options:NSFileVersionAddingOptions,  outError:NSError*,  null:10_7):NSFileVersion;
	public  function removeOtherVersionsOfItemAtURL( url:NSURL,  outError:NSError*):Bool;
	public  function temporaryDirectoryURLForNewVersionOfItemAtURL( url:NSURL,  null:10_7):NSURL;
	public  function unresolvedConflictVersionsOfItemAtURL( url:NSURL):NSArray;
	public  function versionOfItemAtURL( url:NSURL,  persistentIdentifier:Dynamic):NSFileVersion;

	//Properties
	public var URL(default, null):NSURL;
	public var localizedName(default, null):NSString;
	public var localizedNameOfSavingComputer(default, null):NSString;
	public var modificationDate(default, null):NSDate;
	public var persistentIdentifier(default, null):>;
	public var conflict(default, null):Bool;
	public var resolved(default, default):Bool;
	public var )(default, default):10_7;

	//Methods
	public  function replaceItemAtURL( url:NSURL,  options:NSFileVersionReplacingOptions,  error:NSError*):NSURL;
	public  function removeAndReturnError( outError:NSError*):Bool;
}

extern enum NSFileVersionAddingOptions
{
	NSFileVersionAddingByMoving;
}

extern enum NSFileVersionReplacingOptions
{
	NSFileVersionReplacingByMoving;
}

