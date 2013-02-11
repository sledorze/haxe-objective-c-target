import ios.ui.UIApplicationMain;
import ios.ui.UIApplicationDelegate;
import ios.ui.UIResponder;
import ios.ui.UIImageView;
import ios.ui.UIImage;
import ios.ui.UILabel;
import ios.ui.UIWindow;
import ios.ui.UIScreen;
import ios.ui.UIView;
import ios.ui.UIButton;
import ios.ui.UIControl;
import ios.ui.UIViewController;
import ios.ui.UIApplication;
import ios.ui.UIColor;
import ios.ui.UIFont;
import ios.ui.NSText;
import objc.foundation.NSDictionary;
import objc.graphics.CGGeometry;


class PiratePig extends UIResponder implements UIApplicationDelegate {
	
	public var window :UIWindow;
	public var viewController :UIViewController;
	public var view :UIView;
	
	var background :UIImageView;
	var footer :UIImageView;
	var game :PiratePigGame;
	
	
	public function application (application:UIApplication, didFinishLaunchingWithOptions:NSDictionary) :Bool {
		
		trace("Start");
		
		window = new UIWindow();
		var screen = UIScreen.mainScreen();
		window.frame = screen.bounds;
		
		view = new UIView();
		view.frame = new CGRect(0, 0, window.frame.size.width, window.frame.size.height);
		view.autoresizesSubviews = true;
		view.autoresizingMask = untyped UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		view.backgroundColor = UIColor.darkGrayColor();
		
		initialize ();
		construct ();
		
		viewController = new UIViewController();
		viewController.view = view;
		window.rootViewController = viewController;
		window.makeKeyAndVisible();
		
		return true;
	}
	private function construct ():Void {
		view.addSubview (background);
		view.addSubview (footer);
		view.addSubview (game);
	}
	private function initialize ():Void {
		background = new UIImageView().initWithImage ( UIImage.imageNamed("background_tile.png") );
		footer = new UIImageView().initWithImage ( UIImage.imageNamed("center_bottom.png"));
		game = new PiratePigGame ();
	}
	public function applicationDidBecomeActive (application:UIApplication) :Void {}
	public function applicationWillResignActive (application:UIApplication) :Void {}
		
		
		

	public static function main() {
		return new UIApplicationMain ( PiratePig );
	}
}