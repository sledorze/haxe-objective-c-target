package objc.foundation;


extern class NSJSONSerialization extends NSObject
{

	//Constants

	//Static Methods
	public static function isValidJSONObject( obj:Dynamic):Bool;
	public static function dataWithJSONObject( obj:Dynamic,  opt:NSJSONWritingOptions,  error:NSError):NSData;
	public static function JSONObjectWithStream( stream:NSInputStream,  opt:NSJSONReadingOptions,  error:NSError):Dynamic;
	public static function JSONObjectWithData( data:NSData,  opt:NSJSONReadingOptions,  error:NSError):Dynamic;
	public static function writeJSONObject( obj:Dynamic,  stream:NSOutputStream,  opt:NSJSONWritingOptions,  error:NSError):Int;

	//Properties

	//Methods
}

extern enum NSJSONReadingOptions
{
	NSJSONReadingMutableContainers;
	NSJSONReadingMutableLeaves;
	NSJSONReadingAllowFragments;
}

extern enum NSJSONWritingOptions
{
	NSJSONWritingPrettyPrinted;
}

