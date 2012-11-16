package objc.foundation;


extern class NSLocale, implements NSCopying, implements NSSecureCoding
{

	//Constants

	//Static Methods
	public  function systemLocale():Dynamic;
	public  function localeIdentifierFromComponents( dict:NSDictionary):String;
	public  function characterDirectionForLanguage( isoLangCode:String):NSLocaleLanguageDirection;
	public  function ISOCountryCodes():NSArray;
	public  function availableLocaleIdentifiers():NSArray;
	public  function componentsFromLocaleIdentifier( string:String):NSDictionary;
	public  function localeIdentifierFromWindowsLocaleCode( lcid:uint32_t):String;
	public  function windowsLocaleCodeFromLocaleIdentifier( localeIdentifier:String):uint32_t;
	public  function lineDirectionForLanguage( isoLangCode:String):NSLocaleLanguageDirection;
	public  function autoupdatingCurrentLocale():Dynamic;
	public  function commonISOCurrencyCodes():NSArray;
	public  function ISOCurrencyCodes():NSArray;
	public  function canonicalLanguageIdentifierFromString( string:String):String;
	public  function currentLocale():Dynamic;
	public  function canonicalLocaleIdentifierFromString( string:String):String;
	public  function ISOLanguageCodes():NSArray;
	public  function preferredLanguages():NSArray;

	//Properties

	//Methods
	public  function objectForKey( key:Dynamic):Dynamic;
	public  function displayNameForKey( key:Dynamic,  value:Dynamic):String;
	public  function localeIdentifier():String;
	public  function initWithLocaleIdentifier( string:String):Dynamic;
}

extern enum NSLocaleLanguageDirection
{
	NSLocaleLanguageDirectionUnknown;
	NSLocaleLanguageDirectionLeftToRight;
	NSLocaleLanguageDirectionRightToLeft;
	NSLocaleLanguageDirectionTopToBottom;
	NSLocaleLanguageDirectionBottomToTop;
}

