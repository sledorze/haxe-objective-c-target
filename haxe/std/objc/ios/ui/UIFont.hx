package objc.ios.ui;

extern class UIFont extends NSObject {

	public static function fontWithName (fontName:String, fontSize:CGFloat) :UIFont;

	// Returns an array of font family names for all installed fonts
	public static function familyNames () :Array;
	// Returns an array of font names for the specified family name
	public static function fontNamesForFamilyName (familyName:String) :Array;

	// Some convenience methods to create system fonts
	public static function systemFontOfSize:(CGFloat)fontSize :UIFont;
	public static function boldSystemFontOfSize:(CGFloat)fontSize :UIFont;
	public static function italicSystemFontOfSize:(CGFloat)fontSize :UIFont;

	// Font attributes
	 public var familyName :String;
	 public var fontName :String;
	 public var pointSize :CGFloat;
	 public var ascender :CGFloat;
	 public var descender :CGFloat;
	 public var capHeight :CGFloat;
	 public var xHeight :CGFloat;
	 public var lineHeight :CGFloat;

	 // Create a new font that is identical to the current font except the specified size
	public function fontWithSize (fontSize:CGFloat) :UIFont;

}
