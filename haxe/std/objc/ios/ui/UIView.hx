package objc.ios.ui;

extern class UIView {
	
	public var clipsToBounds :Bool;
	
	public static function commitAnimations () :Void;
	public static function setAnimationDuration (delay:Float) :Void;
	
	public var frame :CGRect;
	public var bounds :CGRect;
	public var autoresizesSubviews :Bool;
	public var backgroundColor :UIColor;
	
	function new() : Void;
	//public function initWithFrame (frame:CGRect) : Void;
	public function addSubview (subview:UIView) : Void;
}
/*
extern class UIView {
	Initializing a View Object
	– initWithFrame:
	Configuring a View’s Visual Appearance
	  backgroundColor  property
	  hidden  property
	  alpha  property
	  opaque  property
	  clipsToBounds  property
	  clearsContextBeforeDrawing  property
	+ layerClass
	  layer  property
	Configuring the Event-Related Behavior
	  userInteractionEnabled  property
	  multipleTouchEnabled  property
	  exclusiveTouch  property
	Configuring the Bounds and Frame Rectangles
	  frame  property
	  bounds  property
	  center  property
	  transform  property
	Configuring the Resizing Behavior
	  autoresizingMask  property
	  autoresizesSubviews  property
	  contentMode  property
	  contentStretch  property
	– sizeThatFits:
	– sizeToFit
	Managing the View Hierarchy
	  superview  property
	  subviews  property
	  window  property
	– addSubview:
	– bringSubviewToFront:
	– sendSubviewToBack:
	– removeFromSuperview
	– insertSubview:atIndex:
	– insertSubview:aboveSubview:
	– insertSubview:belowSubview:
	– exchangeSubviewAtIndex:withSubviewAtIndex:
	– isDescendantOfView:
	Laying out Subviews
	– layoutSubviews
	– setNeedsLayout
	– layoutIfNeeded
	Drawing and Updating the View
	– drawRect:
	– setNeedsDisplay
	– setNeedsDisplayInRect:
	  contentScaleFactor  property
	Formatting Printed View Content
	– viewPrintFormatter
	– drawRect:forViewPrintFormatter:
	Managing Gesture Recognizers
	– addGestureRecognizer:
	– removeGestureRecognizer:
	  gestureRecognizers  property
	Animating Views with Blocks
	+ animateWithDuration:delay:options:animations:completion:
	+ animateWithDuration:animations:completion:
	+ animateWithDuration:animations:
	+ transitionWithView:duration:options:animations:completion:
	+ transitionFromView:toView:duration:options:completion:
	Animating Views
	Use of the methods in this section is discouraged in iOS 4 and later. Use the block-based animation methods instead.

	+ beginAnimations:context:
	+ commitAnimations
	+ setAnimationStartDate:
	+ setAnimationsEnabled:
	+ setAnimationDelegate:
	+ setAnimationWillStartSelector:
	+ setAnimationDidStopSelector:
	+ setAnimationDuration:
	+ setAnimationDelay:
	+ setAnimationCurve:
	+ setAnimationRepeatCount:
	+ setAnimationRepeatAutoreverses:
	+ setAnimationBeginsFromCurrentState:
	+ setAnimationTransition:forView:cache:
	+ areAnimationsEnabled
	Identifying the View at Runtime
	  tag  property
	– viewWithTag:
	Converting Between View Coordinate Systems
	– convertPoint:toView:
	– convertPoint:fromView:
	– convertRect:toView:
	– convertRect:fromView:
	Hit Testing in a View
	– hitTest:withEvent:
	– pointInside:withEvent:
	Ending a View Editing Session
	– endEditing:
	Observing View-Related Changes
	– didAddSubview:
	– willRemoveSubview:
	– willMoveToSuperview:
	– didMoveToSuperview
	– willMoveToWindow:
	– didMoveToWindow
}*/