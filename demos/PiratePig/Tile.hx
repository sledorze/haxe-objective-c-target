import ios.ui.UIImageView;
import ios.ui.UIImage;
import ios.ui.UIView;
import objc.graphics.CGGeometry;


class Tile extends UIView {
	
	public var column:Int;
	public var moving:Bool;
	public var removed:Bool;
	public var row:Int;
	public var type:Int;
	
	
	public function new (imagePath:String) {
		
		super ();
		
		var image = new UIImageView().initWithImage ( UIImage.imageNamed(imagePath));
		addSubview (image);
		
		userInteractionEnabled = true;
		
		// Currently, MouseEvent listeners are added to each Tile.
		// To make them easier to tap, add an empty fill to increase 
		// the size of the hit area
		
		//graphics.beginFill (0x000000, 0);
		//graphics.drawRect (-5, -5, 66, 66);
		
	}
	
	
	public function initialize ():Void {
		moving = false;
		removed = false;
		this.alpha = 1;
	}
	
	
	public function moveTo (duration:Float, targetX:Float, targetY:Float):Void {
		
		moving = true;
		
		UIView.beginAnimations ("move_to", null);
		UIView.setAnimationDelegate(this);
		UIView.setAnimationDuration ( duration );
		untyped __objc__("[UIView setAnimationDidStopSelector: @selector(animationDidStop:finished:context:)]");
		
		this.alpha = 1;
		var rect :CGRect = this.frame;
		rect.origin.x = targetX;
		rect.origin.y = targetY;
		this.frame = rect;
		
		UIView.commitAnimations();
		//Actuate.tween (this, duration, { x: targetX, y: targetY } ).ease (Quad.easeOut).onComplete (this_onMoveToComplete);
		
	}
	
	
	public function remove (animate:Bool = true):Void {
		
		userInteractionEnabled = false;
				
		superview.insertSubview (this, 0);
		
		// This is how the animations are done
		UIView.beginAnimations ("fade_out", null);
		UIView.setAnimationDelegate(this);
		UIView.setAnimationDuration ( 0.6 );
		untyped __objc__("[UIView setAnimationDidStopSelector: @selector(animationDidStop:finished:context:)]");
		
		this.alpha = 0;
		var rect :CGRect = this.frame;
		rect.origin.x = rect.origin.x - rect.size.width / 2;
		rect.origin.y = rect.origin.y - rect.size.height / 2;
		this.frame = rect;
		
		UIView.commitAnimations();
		//Actuate.tween (this, 0.6, { alpha: 0, scaleX: 2, scaleY: 2, x: x - width / 2, y: y - height / 2 } ).onComplete (this_onRemoveComplete);
				
		
		removed = true;
	}
	
	
	
	
	// Event Handlers
	
	function animationDidStop (animationID:String, finished:Float, context:Dynamic) {
		if (animationID == "fade_out") {
			this.removeFromSuperview();
		}
		else if (animationID == "move_to") {
			moving = false;
		}
	}
}
