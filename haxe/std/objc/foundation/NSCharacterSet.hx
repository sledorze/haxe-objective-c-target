package objc.foundation;
import objc.foundation.NSObject;


extern class NSCharacterSet extends NSObject, implements NSCopying, implements NSMutableCopying, implements NSCoding
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
	public  function characterIsMember( aCharacter:String):Bool;
	public  function hasMemberInPlane( thePlane:Int):Bool;
	public  function formUnionWithCharacterSet( otherSet:NSCharacterSet):Void;
	public  function addCharactersInRange( aRange:NSRange):Void;
	public  function longCharacterIsMember( theLongChar:String):Bool;
	public  function removeCharactersInRange( aRange:NSRange):Void;
	public  function addCharactersInString( aString:String):Void;
	public  function bitmapRepresentation():NSData;
}

