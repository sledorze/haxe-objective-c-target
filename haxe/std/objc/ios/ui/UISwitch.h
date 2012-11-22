//
//  UISwitch.h
package objc.ios.ui;
//
//  Copyright (c) 2008-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIControl.h>
#import <UIKit/UIKitDefines.h>

extern class UISwitch : UIControl, implements NSObject> {
  @private
    id _control;
}

	public var  UIColor *onTintColor NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
	public var  UIColor *tintColor NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;
	public var  UIColor *thumbTintColor NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;

	public var  UIImage *onImage NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;
	public var  UIImage *offImage NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;

	public var (nonatomic,getter=isOn) BOOL on;

- (id)initWithFrame:(CGRect)frame;              // This class enforces a size appropriate for the control. The frame size is ignored.

	public function setOn:(BOOL)on animated:(BOOL)animated; // does not send action

}
