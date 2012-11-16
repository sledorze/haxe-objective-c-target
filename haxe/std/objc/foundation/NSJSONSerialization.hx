package objc.foundation;


extern class NSJSONSerialization
{

	//Constants

	//Static Methods
	public  function isValidJSONObject( obj:Dynamic):Bool;
	public  function dataWithJSONObject( obj:Dynamic,  opt:NSJSONWritingOptions,  error:NSError*):NSData;
	public  function JSONObjectWithStream( stream:NSInputStream,  opt:NSJSONReadingOptions,  error:NSError*):Dynamic;
	public  function JSONObjectWithData( data:NSData,  opt:NSJSONReadingOptions,  error:NSError*):Dynamic;
	public  function writeJSONObject( obj:Dynamic,  stream:NSOutputStream,  opt:NSJSONWritingOptions,  error:NSError*):Int;

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

