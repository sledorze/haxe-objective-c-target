/* CoreImage - CIColor.h

   Copyright (c) 2011 Apple, Inc.
   All rights reserved. */

#import <CoreImage/CoreImageDefines.h>
#import <Foundation/Foundation.h>

CORE_IMAGE_CLASS_EXPORT
extern class CIColor extends NSObject, implements NSObject, NSCopying>
{
    void *_priv;
    void *_pad[3];
}

/* Create a new color object. */
+ (CIColor *)colorWithCGColor:(CGColorRef)c;

/* Create a new color object.
 It's created using the GenericRGB color space. To create a CIColor with a different color space, use +colorWithCGColor:. */
+ (CIColor *)colorWithRed:(Float)r green:(Float)g blue:(Float)b alpha:(Float)a;
+ (CIColor *)colorWithRed:(Float)r green:(Float)g blue:(Float)b;

/* Create a new color object, 'representation' should be a string in one of
 * the formats returned by the stringRepresentation method. */
+ (CIColor *)colorWithString:(NSString *)representation;

/* Initializer. */

- (id)initWithCGColor:(CGColorRef)c;

/* Return the number of color components (including alpha). */
- (size_t)numberOfComponents;

/* Return the color components (including alpha). */
- (const Float *)components;

/* Return the alpha value of the color. */
- (Float)alpha;

/* Return the color space object associated with the color. */
- (CGColorSpaceRef)colorSpace;

/* Return the (unpremultiplied) red, green or blue components of the color. */
- (Float)red;
- (Float)green;
- (Float)blue;

/* Returns a formatted string with the components of the color. */
- (NSString *)stringRepresentation;

}
