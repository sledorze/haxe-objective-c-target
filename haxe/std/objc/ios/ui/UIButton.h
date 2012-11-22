//
//  UIButton.h
package objc.ios.ui;
//
//  Copyright (c) 2005-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIControl.h>
#import <UIKit/UIGeometry.h>
#import <UIKit/UIStringDrawing.h>
#import <UIKit/UIKitDefines.h>

@class UIImage, UIFont, UIColor, UIImageView, UILabel;

typedef NS_ENUM(NSInteger, UIButtonType) {
    UIButtonTypeCustom = 0,           // no button type
    UIButtonTypeRoundedRect,          // rounded rect, flat white button, like in address card

    UIButtonTypeDetailDisclosure,
    UIButtonTypeInfoLight,
    UIButtonTypeInfoDark,
    UIButtonTypeContactAdd,
};

extern class UIButton : UIControl, implements NSObject> {
  @private
    CFMutableDictionaryRef _contentLookup;
    UIEdgeInsets           _contentEdgeInsets;
    UIEdgeInsets           _titleEdgeInsets;
    UIEdgeInsets           _imageEdgeInsets;
    UIImageView           *_backgroundView;
    UIImageView           *_imageView;
    UILabel               *_titleView;
    BOOL                  _initialized;
    struct {
        unsigned int reversesTitleShadowWhenHighlighted:1;
        unsigned int adjustsImageWhenHighlighted:1;
        unsigned int adjustsImageWhenDisabled:1;
        unsigned int autosizeToFit:1;
        unsigned int disabledDimsImage:1;
        unsigned int showsTouchWhenHighlighted:1;
        unsigned int buttonType:8;
        unsigned int shouldHandleScrollerMouseEvent:1;
    } _buttonFlags;
}

+ (id)buttonWithType:(UIButtonType)buttonType;

	public var           UIEdgeInsets contentEdgeInsets;              // default is UIEdgeInsetsZero
	public var           UIEdgeInsets titleEdgeInsets;                // default is UIEdgeInsetsZero
	public var           BOOL         reversesTitleShadowWhenHighlighted; // default is NO. if YES, shadow reverses to shift between engrave and emboss appearance
	public var           UIEdgeInsets imageEdgeInsets;                // default is UIEdgeInsetsZero
	public var           BOOL         adjustsImageWhenHighlighted;    // default is YES. if YES, image is drawn darker when highlighted(pressed)
	public var           BOOL         adjustsImageWhenDisabled;       // default is YES. if YES, image is drawn lighter when disabled
	public var           BOOL         showsTouchWhenHighlighted;      // default is NO. if YES, show a simple feedback (currently a glow) while highlighted
	public var (nonatomic,retain)   UIColor     *tintColor NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR; // default is nil. only valid for some button types
	public var (default, null) UIButtonType buttonType;

// you can set the image, title color, title shadow color, and background image to use for each state. you can specify data
// for a combined state by using the flags added together. in general, you should specify a value for the normal state to be used
// by other states which don't have a custom value set

	public function setTitle:(NSString *)title forState:(UIControlState)state;                     // default is nil. title is assumed to be single line
	public function setTitleColor:(UIColor *)color forState:(UIControlState)state;                 // default if nil. use opaque white
	public function setTitleShadowColor:(UIColor *)color forState:(UIControlState)state;           // default is nil. use 50% black
	public function setImage:(UIImage *)image forState:(UIControlState)state;                      // default is nil. should be same size if different for different states
	public function setBackgroundImage:(UIImage *)image forState:(UIControlState)state;            // default is nil
	public function setAttributedTitle:(NSAttributedString *)title forState:(UIControlState)state NS_AVAILABLE_IOS(6_0); // default is nil. title is assumed to be single line

- (NSString *)titleForState:(UIControlState)state;          // these getters only take a single state value
- (UIColor *)titleColorForState:(UIControlState)state;
- (UIColor *)titleShadowColorForState:(UIControlState)state;
- (UIImage *)imageForState:(UIControlState)state;
- (UIImage *)backgroundImageForState:(UIControlState)state;
- (NSAttributedString *)attributedTitleForState:(UIControlState)state NS_AVAILABLE_IOS(6_0);

// these are the values that will be used for the current state. you can also use these for overrides. a heuristic will be used to
// determine what image to choose based on the explict states set. For example, the 'normal' state value will be used for all states
// that don't have their own image defined.

	public var (default, null) NSString *currentTitle;             // normal/highlighted/selected/disabled. can return nil
	public var (default, null) UIColor  *currentTitleColor;        // normal/highlighted/selected/disabled. always returns non-nil. default is white(1,1)
	public var (default, null) UIColor  *currentTitleShadowColor;  // normal/highlighted/selected/disabled. default is white(0,0.5).
	public var (default, null) UIImage  *currentImage;             // normal/highlighted/selected/disabled. can return nil
	public var (default, null) UIImage  *currentBackgroundImage;   // normal/highlighted/selected/disabled. can return nil
	public var (default, null) NSAttributedString *currentAttributedTitle NS_AVAILABLE_IOS(6_0);  // normal/highlighted/selected/disabled. can return nil

// return title and image views. will always create them if necessary. always returns nil for system buttons
	public var (default, null) UILabel     *titleLabel NS_AVAILABLE_IOS(3_0);
	public var (default, null) UIImageView *imageView  NS_AVAILABLE_IOS(3_0);

// these return the rectangle for the background (assumes bounds), the content (image + title) and for the image and title separately. the content rect is calculated based
// on the title and image size and padding and then adjusted based on the control content alignment. there are no draw methods since the contents
// are rendered in separate subviews (UIImageView, UILabel)

- (CGRect)backgroundRectForBounds:(CGRect)bounds;
- (CGRect)contentRectForBounds:(CGRect)bounds;
- (CGRect)titleRectForContentRect:(CGRect)contentRect;
- (CGRect)imageRectForContentRect:(CGRect)contentRect;
}

extern class UIButton(UIButtonDeprecated)

	public var (nonatomic,retain) UIFont         *font              NS_DEPRECATED_IOS(2_0, 3_0);
	public var         NSLineBreakMode lineBreakMode     NS_DEPRECATED_IOS(2_0, 3_0);
	public var         CGSize          titleShadowOffset NS_DEPRECATED_IOS(2_0, 3_0);

}
