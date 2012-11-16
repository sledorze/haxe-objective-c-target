package objc.foundation;


extern class NSCoder extends NSObject
{

	//Constants

	//Static Methods

	//Properties

	//Methods
	public  function encodeBycopyObject( anObject:Dynamic):Void;
	public  function encodeInt64( intv:Int,  key:String):Void;
	public  function decodeDataObject():NSData;
	public  function decodeObjectForKey( key:String):Dynamic;
	public  function decodePropertyListForKey( key:String):Dynamic;
	//public  function encodeArrayOfObjCType( type:constchar,  count:Int,  array:constvoid):Void;
	public  function containsValueForKey( key:String):Bool;
	public  function decodeInt32ForKey( key:String):Int;
	public  function encodeByrefObject( anObject:Dynamic):Void;
	//public  function encodeBytes( byteaddr:constvoid,  length:Int):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	//public  function encodeBytes1( bytesp:constuint8_t,  lenv:Int,  key:String):Void;
	public  function decodeInt64ForKey( key:String):Int;
	public  function encodeNXObject( object:Dynamic):Void;
	//public  function decodeArrayOfObjCType( itemType:constchar,  count:Int,  array:Dynamic):Void;
	public  function decodeDoubleForKey( key:String):Float;
	public  function decodeObjectOfClasses( classes:NSSet,  key:String):Dynamic;
	public  function encodeRootObject( rootObject:Dynamic):Void;
	public  function setObjectZone( zone:NSZone):Void;
	public  function systemVersion():Int;
	public  function decodeNXObject():Dynamic;
	//public  function encodeValueOfObjCType( type:constchar,  addr:constvoid):Void;
	public  function encodePropertyList( aPropertyList:Dynamic):Void;
	public  function decodeIntForKey( key:String):Int;
	//public  function encodeValuesOfObjCTypes( types:constchar):Void;
	public  function encodeFloat( realv:Float,  key:String):Void;
	public  function decodeBoolForKey( key:String):Bool;
	//public  function decodeValueOfObjCType( type:constchar,  data:Dynamic):Void;
	public  function encodeConditionalObject( object:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function encodeConditionalObject1( objv:Dynamic,  key:String):Void;
	public  function decodePropertyList():Dynamic;
	//public  function decodeValuesOfObjCTypes( types:constchar):Void;
	public  function allowsKeyedCoding():Bool;
	public  function encodeInt( intv:Int,  key:String):Void;
	public  function encodeDouble( realv:Float,  key:String):Void;
	public  function encodeBool( boolv:Bool,  key:String):Void;
	public  function decodeFloatForKey( key:String):Float;
	public  function encodeInteger( intv:Int,  key:String):Void;
	//public  function decodeObjectOfClass( aClass:Class,  key:String):Dynamic;
	public  function encodeObject( object:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function encodeObject1( objv:Dynamic,  key:String):Void;
	//public  function decodeBytesForKey( key:String,  lengthp:Int):constuint8_t;
	public  function decodeIntegerForKey( key:String):Int;
	public  function allowedClasses():NSSet;
	public  function requiresSecureCoding():Bool;
	public  function decodeObject():Dynamic;
	public  function versionForClassName( className:String):Int;
	public  function encodeDataObject( data:NSData):Void;
	public  function objectZone():NSZone;
	public  function decodeBytesWithReturnedLength( lengthp:Int):Dynamic;
	public  function encodeInt32( intv:Int,  key:String):Void;
}

