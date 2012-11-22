//
//  UIBezierPath.h
package objc.ios.ui;
//
//  Copyright (c) 2009-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKitDefines.h>

typedef NS_OPTIONS(NSUInteger, UIRectCorner) {
    UIRectCornerTopLeft     = 1 << 0,
    UIRectCornerTopRight    = 1 << 1,
    UIRectCornerBottomLeft  = 1 << 2,
    UIRectCornerBottomRight = 1 << 3,
    UIRectCornerAllCorners  = ~0UL
};

extern class UIBezierPath extends NSObject<NSCopying, NSCoding> {
@private
    CGPathRef _path;
    CGFloat *_lineDashPattern;
    NSUInteger _lineDashPatternCount;
    CGFloat _lineWidth, _miterLimit, _flatness, _lineDashPhase;
    CGLineCap _lineCapStyle;
    CGLineJoin _lineJoinStyle;
    BOOL _usesEvenOddFillRule;
    CGPathRef _immutablePath;
    BOOL _immutablePathIsValid;
}

+ (UIBezierPath *)bezierPath;
+ (UIBezierPath *)bezierPathWithRect:(CGRect)rect;
+ (UIBezierPath *)bezierPathWithOvalInRect:(CGRect)rect;
+ (UIBezierPath *)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius; // rounds all corners with the same horizontal and vertical radius
+ (UIBezierPath *)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;
+ (UIBezierPath *)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
+ (UIBezierPath *)bezierPathWithCGPath:(CGPathRef)CGPath;

// Returns an immutable CGPathRef which is only valid until the UIBezierPath is further mutated.
// Setting the path will create an immutable copy of the provided CGPathRef, so any further mutations on a provided CGMutablePathRef will be ignored.
	public var  CGPathRef CGPath;

// Path construction

	public function moveToPoint:(CGPoint)point;
	public function addLineToPoint:(CGPoint)point;
	public function addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2;
	public function addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint;
	public function addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise NS_AVAILABLE_IOS(4_0);
	public function closePath;

	public function removeAllPoints;

// Appending paths

	public function appendPath:(UIBezierPath *)bezierPath;

// Modified paths

- (UIBezierPath *)bezierPathByReversingPath NS_AVAILABLE_IOS(6_0);

// Transforming paths

	public function applyTransform:(CGAffineTransform)transform;

// Path info

	public var (readonly,getter=isEmpty) BOOL empty;
	public var (default, null) CGRect bounds;
	public var (default, null) CGPoint currentPoint;
- (BOOL)containsPoint:(CGPoint)point;

// Drawing properties

	public var  CGFloat lineWidth;
	public var  CGLineCap lineCapStyle;
	public var  CGLineJoin lineJoinStyle;
	public var  CGFloat miterLimit; // Used when lineJoinStyle is kCGLineJoinMiter
	public var  CGFloat flatness;
	public var  BOOL usesEvenOddFillRule; // Default is NO. When YES, the even-odd fill rule is used for drawing, clipping, and hit testing.

	public function setLineDash:(const CGFloat *)pattern count:(NSInteger)count phase:(CGFloat)phase;
	public function getLineDash:(CGFloat *)pattern count:(NSInteger *)count phase:(CGFloat *)phase;

// Path operations on the current graphics context

	public function fill;
	public function stroke;

// These methods do not affect the blend mode or alpha of the current graphics context
	public function fillWithBlendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
	public function strokeWithBlendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;

	public function addClip;

}
