package objc.foundation;


extern class NSCharacterSet, implements NSCopying, implements NSMutableCopying, implements NSCoding
{

	//Constants

	//Static Methods
	public  function decomposableCharacterSet():Dynamic;
	public  function symbolCharacterSet():Dynamic;
	public  function newlineCharacterSet():Dynamic;
	public  function lowercaseLetterCharacterSet():Dynamic;
	public  function punctuationCharacterSet():Dynamic;
	public  function alphanumericCharacterSet():Dynamic;
	public  function controlCharacterSet():Dynamic;
	public  function whitespaceCharacterSet():Dynamic;
	public  function characterSetWithContentsOfFile( fName:String):Dynamic;
	public  function characterSetWithBitmapRepresentation( data:NSData):Dynamic;
	public  function whitespaceAndNewlineCharacterSet():Dynamic;
	public  function letterCharacterSet():Dynamic;
	public  function uppercaseLetterCharacterSet():Dynamic;
	public  function nonBaseCharacterSet():Dynamic;
	public  function illegalCharacterSet():Dynamic;
	public  function capitalizedLetterCharacterSet():Dynamic;
	public  function characterSetWithCharactersInString( aString:String):Dynamic;
	public  function decimalDigitCharacterSet():Dynamic;
	public  function characterSetWithRange( aRange:NSRange):Dynamic;

	//Properties

	//Methods
	public  function invertedSet():NSCharacterSet;
	public  function isSupersetOfSet( theOtherSet:NSCharacterSet):Bool;
	public  function removeCharactersInString( aString:String):Void;
	public  function formIntersectionWithCharacterSet( otherSet:NSCharacterSet):Void;
	public  function invert():Void;
	public  function characterIsMember( aCharacter:unichar):Bool;
	public  function hasMemberInPlane( thePlane:uint8_t):Bool;
	public  function formUnionWithCharacterSet( otherSet:NSCharacterSet):Void;
	public  function addCharactersInRange( aRange:NSRange):Void;
	public  function longCharacterIsMember( theLongChar:UTF32Char):Bool;
	public  function removeCharactersInRange( aRange:NSRange):Void;
	public  function addCharactersInString( aString:String):Void;
	public  function bitmapRepresentation():NSData;
}

extern enum null
{
}

