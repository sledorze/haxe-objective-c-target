package objc.foundation;


extern class NSValueTransformer
{

	//Constants

	//Static Methods
	public  function transformedValueClass():Class;
	public  function allowsReverseTransformation():Bool;
	public  function valueTransformerForName( name:String):NSValueTransformer;
	public  function valueTransformerNames():NSArray;
	public  function setValueTransformer( transformer:NSValueTransformer,  name:String):Void;

	//Properties

	//Methods
	public  function transformedValue( value:Dynamic):Dynamic;
	public  function reverseTransformedValue( value:Dynamic):Dynamic;
}

