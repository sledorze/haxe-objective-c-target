package objc.foundation;
import objc.foundation.NSObject;


extern class NSString extends NSObject, implements NSCopying, implements NSMutableCopying, implements NSSecureCoding {

	inline public static var NSMaximumStringLength = INT_MAX-1;
	
	inline public static var NSCaseInsensitiveSearch = 1;
	inline public static var NSLiteralSearch = 2;
	inline public static var NSBackwardsSearch = 4;
	inline public static var NSAnchoredSearch = 8;
	inline public static var NSNumericSearch = 64;
	inline public static var NSDiacriticInsensitiveSearch = 128;
	inline public static var NSWidthInsensitiveSearch = 256;
	inline public static var NSForcedOrderingSearch = 512;
	inline public static var NSRegularExpressionSearch = 1024;
	
	inline public static var NSASCIIStringEncoding = 1;
	inline public static var NSNEXTSTEPStringEncoding = 2;
	inline public static var NSJapaneseEUCStringEncoding = 3;
	inline public static var NSUTF8StringEncoding = 4;
	inline public static var NSISOLatin1StringEncoding = 5;
	inline public static var NSSymbolStringEncoding = 6;
	inline public static var NSNonLossyASCIIStringEncoding = 7;
	inline public static var NSShiftJISStringEncoding = 8;
	inline public static var NSISOLatin2StringEncoding = 9;
	inline public static var NSUnicodeStringEncoding = 10;
	inline public static var NSWindowsCP1251StringEncoding = 11;
	inline public static var NSWindowsCP1252StringEncoding = 12;
	inline public static var NSWindowsCP1253StringEncoding = 13;
	inline public static var NSWindowsCP1254StringEncoding = 14;
	inline public static var NSWindowsCP1250StringEncoding = 15;
	inline public static var NSISO2022JPStringEncoding = 21;
	inline public static var NSMacOSRomanStringEncoding = 30;
	inline public static var NSUTF16StringEncoding = NSUnicodeStringEncoding;
	inline public static var NSUTF16BigEndianStringEncoding = 0x90000100;
	inline public static var NSUTF16LittleEndianStringEncoding = 0x94000100;
	inline public static var NSUTF32StringEncoding = 0x8c000100;
	inline public static var NSUTF32BigEndianStringEncoding = 0x98000100;
	inline public static var NSUTF32LittleEndianStringEncoding = 0x9c000100;

	inline public static var NSStringEncodingConversionAllowLossy = 1;
	inline public static var NSStringEncodingConversionExternalRepresentation = 2;
	
	
	public function length () :Int;
	public function characterAtIndex (index:Int) :String;

	public function getCharacters (buffer:String, range:NSRange) :Void;

	public function substringFromIndex (from:Int) :NSString;
	public function substringToIndex (to:Int) :NSString;
	public function substringWithRange (range:NSRange) :NSString;

	public function compare (string:NSString) :NSComparisonResult;
	//public function compare (string:NSString, options:NSStringCompareOptions) :NSComparisonResult;
	//public function compare (string:NSString, options:NSStringCompareOptions, range:NSRange) :NSComparisonResult;
	//public function compare (string:NSString, options:NSStringCompareOptions, range:NSRange, locale:Dynamic) :NSComparisonResult;
	public function caseInsensitiveCompare (string:NSString) :NSComparisonResult;
	public function localizedCompare (string:NSString) :NSComparisonResult;
	public function localizedCaseInsensitiveCompare (string:NSString) :NSComparisonResult;
	public function localizedStandardCompare (string:NSString) :NSComparisonResult;

	public function isEqualToString (NSString) :Bool;
	public function hasPrefix (aString:NSString) :Bool;
	public function hasSuffix (aString:NSString) :Bool;

/* These methods return length==0 if the target string is not found. So, to check for containment: ([str rangeOfString:@"target"].length > 0).  Note that the length of the range returned by these methods might be different than the length of the target string, due composed characters and such.
*/
	public function rangeOfString (aString:NSString) :NSRange;
	//public function rangeOfString(aString:NSString, options:NSStringCompareOptions) :NSRange;
	//public function rangeOfString(aString:NSString, options:NSStringCompareOptions, range:NSRange) :NSRange;
	//public function rangeOfString(aString:NSString, options:NSStringCompareOptions, range:NSRange, locale:NSLocale) :NSRange;
	public function rangeOfCharacterFromSet (aSet:NSCharacterSet) :NSRange;
	//public function rangeOfCharacterFromSet:(NSCharacterSet *)aSet options:(NSStringCompareOptions)mask;
	//public function rangeOfCharacterFromSet:(NSCharacterSet *)aSet options:(NSStringCompareOptions)mask range:(NSRange)searchRange;
	public function rangeOfComposedCharacterSequenceAtIndex (index:Int) :NSRange;
	public function rangeOfComposedCharacterSequencesForRange (range:NSRange) :NSRange;

	public function stringByAppendingString (aString:NSString) :NSString;
	public function stringByAppendingFormat (format:NSString) :NSString;

	public function doubleValue () :Int;
	public function floatValue () :Float;
	public function intValue () :Int;
	public function integerValue () :Int;
	public function longLongValue () :Float;
	public function boolValue () :Bool;
	
	public function componentsSeparatedByString (separator:NSString) :NSArray;
	public function componentsSeparatedByCharactersInSet (separator:NSCharacterSet) :NSArray;
	public function commonPrefixWithString (aString:NSString, options:NSStringCompareOptions) :NSString;
	public function uppercaseString () :NSString;
	public function lowercaseString () :NSString;
	public function capitalizedString () :NSString;
	#if (osx_10_8 || ios_6_0)
	public function uppercaseStringWithLocale (locale:NSLocale) :NSString;
	public function lowercaseStringWithLocale (locale:NSLocale) :NSString;
	public function capitalizedStringWithLocale (locale:NSLocale) :NSString;
	#end
	public function stringByTrimmingCharactersInSet (set:NSCharacterSet) :NSString;
	public function stringByPaddingToLength (newLength:Int, withString:NSString, startingAtIndex:Int) :NSString;;

	public function getLineStart (startPtr:Int, end:Int, contentsEnd:Int, forRange:NSRange) :Void;
	public function lineRangeForRange (range:NSRange) :NCRange;

	public function getParagraphStart (startPtr:Int, end:Int, contentsEnd:Int, forRange:NSRange) :Void;
	public function paragraphRangeForRange (range:NSRange) :NSRange;

	inline public static var NSStringEnumerationByLines = 0;
	inline public static var NSStringEnumerationByParagraphs = 1;
	inline public static var NSStringEnumerationByComposedCharacterSequences = 2;
	inline public static var NSStringEnumerationByWords = 3;
	inline public static var NSStringEnumerationBySentences = 4;
	inline public static var NSStringEnumerationReverse = 1UL << 8;
	inline public static var NSStringEnumerationSubstringNotRequired = 1UL << 9;
	inline public static var NSStringEnumerationLocalized = 1UL << 10;
	#if (osx_10_6 || ios_4_0)
	public function enumerateSubstringsInRange (range:NSRange, options:NSStringEnumerationOptions, usingBlock:NSString->NSRange->NSRange->Bool) :Void;
	public function enumerateLinesUsingBlock (block:NSString->Bool) :Void;
	#end

	public function description () :NSString;
	public function hash () :Int;

	public function fastestEncoding () :NSStringEncoding;
	public function smallestEncoding () :NSStringEncoding;

	public function dataUsingEncoding (encoding:NSStringEncoding, allowLossyConversion:Bool) :NSData;
	public function dataUsingEncoding (encoding:NSStringEncoding) :NSData;

	public function canBeConvertedToEncoding (encoding:NSStringEncoding) :Bool;
	public function getCString:(char *)buffer maxLength:(NSUInteger)maxBufferCount encoding:(NSStringEncoding)encoding;
*/
- (BOOL)getBytes:(void *)buffer maxLength:(NSUInteger)maxBufferCount usedLength:(NSUInteger *)usedBufferCount encoding:(NSStringEncoding)encoding options:(NSStringEncodingConversionOptions)options range:(NSRange)range remainingRange:(NSRangePointer)leftover;

/* These return the maximum and exact number of bytes needed to store the receiver in the specified encoding in non-external representation. The first one is O(1), while the second one is O(n). These do not include space for a terminating null.
*/
- (NSUInteger)maximumLengthOfBytesUsingEncoding:(NSStringEncoding)enc;
- (NSUInteger)lengthOfBytesUsingEncoding:(NSStringEncoding)enc;	

- (NSString *)decomposedStringWithCanonicalMapping;
- (NSString *)precomposedStringWithCanonicalMapping;
- (NSString *)decomposedStringWithCompatibilityMapping;
- (NSString *)precomposedStringWithCompatibilityMapping;

/* Returns a string with the character folding options applied. theOptions is a mask of compare flags with *InsensitiveSearch suffix.
*/
- (NSString *)stringByFoldingWithOptions:(NSStringCompareOptions)options locale:(NSLocale *)locale NS_AVAILABLE(10_5, 2_0);

/* Replace all occurrences of the target string in the specified range with replacement. Specified compare options are used for matching target. If NSRegularExpressionSearch is specified, the replacement is treated as a template, as in the corresponding NSRegularExpression methods, and no other options can apply except NSCaseInsensitiveSearch and NSAnchoredSearch.
*/
- (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange NS_AVAILABLE(10_5, 2_0);

/* Replace all occurrences of the target string with replacement. Invokes the above method with 0 options and range of the whole string.
*/
- (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement NS_AVAILABLE(10_5, 2_0);

/* Replace characters in range with the specified string, returning new string.
*/
- (NSString *)stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement NS_AVAILABLE(10_5, 2_0);

- (__strong const char *)UTF8String NS_RETURNS_INNER_POINTER;	// Convenience to return null-terminated UTF8 representation

/* User-dependent encoding who value is derived from user's default language and potentially other factors. The use of this encoding might sometimes be needed when interpreting user documents with unknown encodings, in the absence of other hints.  This encoding should be used rarely, if at all. Note that some potential values here might result in unexpected encoding conversions of even fairly straightforward NSString content --- for instance, punctuation characters with a bidirectional encoding.
*/
+ (NSStringEncoding)defaultCStringEncoding;	// Should be rarely used

+ (const NSStringEncoding *)availableStringEncodings;
+ (NSString *)localizedNameOfStringEncoding:(NSStringEncoding)encoding;

/*** Creation methods ***/

/* In general creation methods in NSString do not apply to subclassers, as subclassers are assumed to provide their own init methods which create the string in the way the subclass wishes.  Designated initializers of NSString are thus init and initWithCoder:.
*/
- (id)init;
- (id)initWithCharactersNoCopy:(unichar *)characters length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer;	/* "NoCopy" is a hint */
- (id)initWithCharacters:(const unichar *)characters length:(NSUInteger)length;
- (id)initWithUTF8String:(const char *)nullTerminatedCString;
- (id)initWithString:(NSString *)aString;
- (id)initWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
- (id)initWithFormat:(NSString *)format arguments:(va_list)argList NS_FORMAT_FUNCTION(1,0);
- (id)initWithFormat:(NSString *)format locale:(id)locale, ... NS_FORMAT_FUNCTION(1,3);
- (id)initWithFormat:(NSString *)format locale:(id)locale arguments:(va_list)argList NS_FORMAT_FUNCTION(1,0);
- (id)initWithData:(NSData *)data encoding:(NSStringEncoding)encoding;
- (id)initWithBytes:(const void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding;
- (id)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding freeWhenDone:(BOOL)freeBuffer;	/* "NoCopy" is a hint */

+ (id)string;
+ (id)stringWithString:(NSString *)string;
+ (id)stringWithCharacters:(const unichar *)characters length:(NSUInteger)length;
+ (id)stringWithUTF8String:(const char *)nullTerminatedCString;
+ (id)stringWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
+ (id)localizedStringWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

- (id)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding;
+ (id)stringWithCString:(const char *)cString encoding:(NSStringEncoding)enc;

/* These use the specified encoding.  If nil is returned, the optional error return indicates problem that was encountered (for instance, file system or encoding errors).
*/
- (id)initWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError **)error;
- (id)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error;
+ (id)stringWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError **)error;
+ (id)stringWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error;

/* These try to determine the encoding, and return the encoding which was used.  Note that these methods might get "smarter" in subsequent releases of the system, and use additional techniques for recognizing encodings. If nil is returned, the optional error return indicates problem that was encountered (for instance, file system or encoding errors).
*/
- (id)initWithContentsOfURL:(NSURL *)url usedEncoding:(NSStringEncoding *)enc error:(NSError **)error;
- (id)initWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError **)error;
+ (id)stringWithContentsOfURL:(NSURL *)url usedEncoding:(NSStringEncoding *)enc error:(NSError **)error;
+ (id)stringWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError **)error;

/* Write to specified url or path using the specified encoding.  The optional error return is to indicate file system or encoding errors.
*/
- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error;
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error;

@end


extern class NSMutableString extends NSString {

	public function replaceCharactersInRange (range:NSRange, withString:NSString) :Void;

	public function insertString (aString:NSString, atIndex:Int) :Void;
	public function deleteCharactersInRange (range:NSRange) :Void;
	public function appendString (aString:NSString) :Void;
	public function appendFormat (format:NSString) :Void;
	public function setString (aString:NSString) :Void;

	public function initWithCapacity (capacity:Int) :NSMutableString;
	public static function stringWithCapacity (capacity:Int) :NSMutableString;

	public function replaceOccurrencesOfString (target:NSString, withString:NSString, options:NSStringCompareOptions, range:NSRange) :Int;

}





/*enum {
    NSProprietaryStringEncoding = 65536    
};
*/


/* The rest of this file is bookkeeping stuff that has to be here. Don't use this stuff, don't refer to it.
*/
#if !defined(_OBJC_UNICHAR_H_)
#define _OBJC_UNICHAR_H_
#endif
#define NS_UNICHAR_IS_EIGHT_BIT 0

@interface NSSimpleCString : NSString {
@package
    char *bytes;
    int numBytes;
#if __LP64__
    int _unused;
#endif
}
@end

@interface NSConstantString : NSSimpleCString
@end

#if __LP64__
#else
extern void *_NSConstantStringClassReference;
#endif

