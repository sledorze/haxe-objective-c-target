package objc.quartz;

import objc.foundation.NSObject;
import objc.graphics.CGGeometry;


/*enum CAEdgeAntialiasingMask
{
  kCALayerLeftEdge	= 1U << 0,	 Minimum X edge. 
  kCALayerRightEdge	= 1U << 1,	 Maximum X edge. 
  kCALayerBottomEdge	= 1U << 2,	 Minimum Y edge. 
  kCALayerTopEdge	= 1U << 3,	 Maximum Y edge. 
};
*/

extern class CALayer extends NSObject, implements NSCoding/*, implements CAMediaTiming*/ {

	public static function layer () :CALayer;

	public function init () :CALayer;
	public function initWithLayer (layer:CALayer) :CALayer;
	public function presentationLayer () :CALayer;
	public function modelLayer () :CALayer;

	public static function defaultValueForKey (key:String) :CALayer;
	public static function needsDisplayForKey (key:String) :Bool;

	public function shouldArchiveValueForKey (key:String) :Bool;

	public var bounds :CGRect;
	public var position :CGPoint;
	public var zPosition :Float;

/*	public var  CGPoint anchorPoint;
	public var  Float anchorPointZ;
	public var  CATransform3D transform;

- (CGAffineTransform)affineTransform;
- (void)setAffineTransform:(CGAffineTransform)m;

	public var  CGRect frame;
	public var (getter=isHidden) BOOL hidden;
	public var (getter=isDoubleSided) BOOL doubleSided;
	public var (getter=isGeometryFlipped) BOOL geometryFlipped;
- (BOOL)contentsAreFlipped;
	public var  (default, null) : CALayer *superlayer; 
- (void)removeFromSuperlayer;
 	public var NSArray *sublayers;
 - (void)addSublayer:(CALayer *)layer;
 - (void)insertSublayer:(CALayer *)layer atIndex:(unsigned)idx;
 - (void)insertSublayer:(CALayer *)layer below:(CALayer *)sibling;
- (void)insertSublayer:(CALayer *)layer above:(CALayer *)sibling;

- (void)replaceSublayer:(CALayer *)layer with:(CALayer *)layer2;

	public var  CATransform3D sublayerTransform;

	public var CALayer *mask;

	public var  BOOL masksToBounds;

//Mapping between layer coordinate and time spaces. 

- (CGPoint)convertPoint:(CGPoint)p fromLayer:(CALayer *)l;
- (CGPoint)convertPoint:(CGPoint)p toLayer:(CALayer *)l;
- (CGRect)convertRect:(CGRect)r fromLayer:(CALayer *)l;
- (CGRect)convertRect:(CGRect)r toLayer:(CALayer *)l;

- (CFTimeInterval)convertTime:(CFTimeInterval)t fromLayer:(CALayer *)l;
- (CFTimeInterval)convertTime:(CFTimeInterval)t toLayer:(CALayer *)l;


- (CALayer *)hitTest:(CGPoint)p;

- (BOOL)containsPoint:(CGPoint)p;


	public var id contents;

	public var  CGRect contentsRect;

	public var NSString *contentsGravity;

	public var  Float contentsScale;

	public var  CGRect contentsCenter;

	public var NSString *minificationFilter, *magnificationFilter;

	public var  float minificationFilterBias;

	public var (getter=isOpaque) BOOL opaque;

- (void)display;

- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)r;

- (BOOL)needsDisplay;

- (void)displayIfNeeded;

	public var  BOOL needsDisplayOnBoundsChange;

	public var  BOOL drawsAsynchronously;

- (void)drawInContext:(CGContextRef)ctx;

- (void)renderInContext:(CGContextRef)ctx;

	public var  unsigned int edgeAntialiasingMask;

	public var  CGColorRef backgroundColor;

	public var  Float cornerRadius;

	public var  Float borderWidth;

	public var  CGColorRef borderColor;

	public var  float opacity;

	public var id compositingFilter;

	public var NSArray *filters;
	
	public var NSArray *backgroundFilters;

	public var  BOOL shouldRasterize;

	public var  Float rasterizationScale;

	public var  CGColorRef shadowColor;

	public var  float shadowOpacity;

	public var  CGSize shadowOffset;

	public var  Float shadowRadius;

	public var  CGPathRef shadowPath;

- (CGSize)preferredFrameSize;

- (void)setNeedsLayout;

- (BOOL)needsLayout;

- (void)layoutIfNeeded;

- (void)layoutSublayers;

+ (id<CAAction>)defaultActionForKey:(NSString *)event;

- (id<CAAction>)actionForKey:(NSString *)event;

	public var NSDictionary *actions;

- (void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key;

- (void)removeAllAnimations;

- (void)removeAnimationForKey:(NSString *)key;

- (NSArray *)animationKeys;

- (CAAnimation *)animationForKey:(NSString *)key;

	public var NSString *name;

	public var (assign) id delegate;

	public var NSDictionary *style;



@protocol CAAction

- (void)runActionForKey:(NSString *)event object:(id)anObject
    arguments:(NSDictionary *)dict;

}

Delegate methods. 

extern class NSObject (CALayerDelegate)


- (void)displayLayer:(CALayer *)layer;

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;

- (void)layoutSublayersOfLayer:(CALayer *)layer;

- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event;

}

CA_EXTERN NSString * const kCAGravityCenter
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAGravityTop
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAGravityBottom
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAGravityLeft
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAGravityRight
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAGravityTopLeft
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAGravityTopRight
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAGravityBottomLeft
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAGravityBottomRight
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAGravityResize
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAGravityResizeAspect
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAGravityResizeAspectFill
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);

Contents filter names. 

CA_EXTERN NSString * const kCAFilterNearest
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAFilterLinear
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);

 Trilinear minification filter. Enables mipmap generation. Some
 * renderers may ignore this, or impose additional restrictions, such
 * as source images requiring power-of-two dimensions. 

CA_EXTERN NSString * const kCAFilterTrilinear
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_3_0);

Layer event names. 

CA_EXTERN NSString * const kCAOnOrderIn
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAOnOrderOut
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);

The animation key used for transitions. 

CA_EXTERN NSString * const kCATransition
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
	
}
