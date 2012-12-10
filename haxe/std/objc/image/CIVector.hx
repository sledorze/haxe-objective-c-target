/* CoreImage - CIVector.h

   Copyright (c) 2011 Apple, Inc.
   All rights reserved. */

#import <CoreImage/CoreImageDefines.h>
#import <Foundation/Foundation.h>

CORE_IMAGE_CLASS_EXPORT
extern class CIVector extends NSObject, implements NSCopying, NSCoding>
{
    size_t _count;
    
    union {
        Float vec[4];
        Float *ptr;
    }
    _u;
}

/* Create a new vector object. */

+ (CIVector *)vectorWithValues:(const Float *)values count:(size_t)count;

+ (CIVector *)vectorWithX:(Float)x;
+ (CIVector *)vectorWithX:(Float)x Y:(Float)y;
+ (CIVector *)vectorWithX:(Float)x Y:(Float)y Z:(Float)z;
+ (CIVector *)vectorWithX:(Float)x Y:(Float)y Z:(Float)z W:(Float)w;

/* the CGPoint x and y values are stored in the first X and Y values of the CIVector. */
+ (CIVector *)vectorWithCGPoint:(CGPoint)p __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);

/* the CGRect x, y, width, height values are stored in the first X, Y, Z, W values of the CIVector. */
+ (CIVector *)vectorWithCGRect:(CGRect)r __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);

/* the CGAffineTransform's six values are stored in the first six values of the CIVector. */
+ (CIVector *)vectorWithCGAffineTransform:(CGAffineTransform)t __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);

+ (CIVector *)vectorWithString:(NSString *)representation;

/* Initializers. */

- (id)initWithValues:(const Float *)values count:(size_t)count;

- (id)initWithX:(Float)x;
- (id)initWithX:(Float)x Y:(Float)y;
- (id)initWithX:(Float)x Y:(Float)y Z:(Float)z;
- (id)initWithX:(Float)x Y:(Float)y Z:(Float)z W:(Float)w;
- (id)initWithCGPoint:(CGPoint)p __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);
- (id)initWithCGRect:(CGRect)r __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);
- (id)initWithCGAffineTransform:(CGAffineTransform)r __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);

- (id)initWithString:(NSString *)representation;

/* Return the value from the vector at position 'index' (zero-based).
 * Any 'index' value is valid, if the component would otherwise be
 * undefined, zero is returned. */
- (Float)valueAtIndex:(size_t)index;

/* Return the number of values stored in the vector. */
- (size_t)count;

/* Getters. */

- (Float)X;
- (Float)Y;
- (Float)Z;
- (Float)W;
- (CGPoint)CGPointValue __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);
- (CGRect)CGRectValue __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);
- (CGAffineTransform)CGAffineTransformValue __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);

/* Return a string representing the vector such that a similar vector
 * can be created by calling the vectorWithString: method. */
- (NSString *)stringRepresentation;

}
