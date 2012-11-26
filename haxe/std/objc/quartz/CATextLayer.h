/* CoreAnimation - CATextLayer.h

   Copyright (c) 2006-2007 Apple Inc.
   All rights reserved. */

#import <QuartzCore/CALayer.h>

/* The text layer provides simple text layout and rendering of plain
 * or attributed strings. The first line is aligned to the top of the
 * layer. */

extern class CATextLayer : CALayer
{
@private
  struct CATextLayerPrivate *_state;
}

/* The text to be rendered, should be either an NSString or an
 * NSAttributedString. Defaults to nil. */

	public var id string;

/* The font to use, currently may be either a CTFontRef, a CGFontRef,
 * or a string naming the font. Defaults to the Helvetica font. Only
 * used when the `string' property is not an NSAttributedString. */

	public var  CFTypeRef font;

/* The font size. Defaults to 36. Only used when the `string' property
 * is not an NSAttributedString. Animatable (Mac OS X 10.6 and later.) */

	public var  Float fontSize;

/* The color object used to draw the text. Defaults to opaque white.
 * Only used when the `string' property is not an NSAttributedString.
 * Animatable (Mac OS X 10.6 and later.) */

	public var  CGColorRef foregroundColor;

/* When true the string is wrapped to fit within the layer bounds.
 * Defaults to NO.*/

	public var (getter=isWrapped) BOOL wrapped;

/* Describes how the string is truncated to fit within the layer
 * bounds. The possible options are `none', `start', `middle' and
 * `end'. Defaults to `none'. */

	public var NSString *truncationMode;

/* Describes how individual lines of text are aligned within the layer
 * bounds. The possible options are `natural', `left', `right',
 * `center' and `justified'. Defaults to `natural'. */

	public var NSString *alignmentMode;

}

/* Truncation modes. */

CA_EXTERN NSString * const kCATruncationNone
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_3_2);
CA_EXTERN NSString * const kCATruncationStart
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_3_2);
CA_EXTERN NSString * const kCATruncationEnd
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_3_2);
CA_EXTERN NSString * const kCATruncationMiddle
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_3_2);

/* Alignment modes. */

CA_EXTERN NSString * const kCAAlignmentNatural
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_3_2);
CA_EXTERN NSString * const kCAAlignmentLeft
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_3_2);
CA_EXTERN NSString * const kCAAlignmentRight
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_3_2);
CA_EXTERN NSString * const kCAAlignmentCenter
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_3_2);
CA_EXTERN NSString * const kCAAlignmentJustified
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_3_2);
