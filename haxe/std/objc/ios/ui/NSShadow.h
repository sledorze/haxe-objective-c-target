//
//  NSShadow.h
package objc.ios.ui;
//
//  Copyright (c) 2002-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

/*
 NSShadow stores the properties of a drop shadow for drawing text.
 To set a shadow on an NSAttributedString use it as a value for NSShadowAttributeName.
 */

NS_CLASS_AVAILABLE_IOS(6_0)extern class NSShadow extends NSObject, implements NSCopying, NSCoding>

	public var CGSize shadowOffset;      // offset in user space of the shadow from the original drawing
	public var CGFloat shadowBlurRadius; // blur radius of the shadow in default user space units
	public var id shadowColor;           // color used for the shadow (default is black with an alpha value of 1/3)

}
