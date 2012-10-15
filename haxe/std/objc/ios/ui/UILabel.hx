package objc.ios.ui;

extern class UILabel extends UIView {
	
	public var text :String;
	public var font :UIFont;
	public var textColor :UIColor;
	public var shadowColor :UIColor;
	public var shadowOffset :CGSize;
	public var textAlignment :NSTextAlignment;
	public var lineBreakMode :NSLineBreakMode;
	
	public var attributedString :NSAttributedString;
	
	public var highlightedTextColor :UIColor;
	public var highlighted :Bool;
	public var userInteractionEnabled :Bool;
	public var enabled :Bool;
	
	public var numberOfLines :NSInteger;
	
	public var adjustsFontSizeToFitWidth :Bool;
	public var adjustsLetterSpacingToFitWidth :Bool;
	public var baselineAdjustment :UIBaselineAdjustment;
	public var minimumScaleFactor :CGFloat;
	public var preferredMaxLayoutWidth :CGFloat;
	
	function new() : Void;
	public function textRectForBounds (bounds:CGRect, numberOfLines:NSInteger) :CGRect;
	public function drawTextInRect (rect:CGRect) :Void;
}
