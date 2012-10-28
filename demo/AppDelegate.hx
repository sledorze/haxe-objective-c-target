
import objc.ios.ui.UIApplicationDelegate;
import objc.ios.ui.UIResponder;
import objc.ios.ui.UIWebView;
import objc.ios.ui.UILabel;
import objc.ios.ui.UIWindow;
import objc.ios.ui.UIScreen;
import objc.ios.ui.UIView;
import objc.ios.ui.UIViewController;
import objc.ios.ui.UIApplication;
import objc.ios.ui.UIColor;
import objc.ios.ui.UIFont;
import objc.ios.ui.UIViewAutoresizing;
import objc.foundation.NSDictionary;



class AppDelegate extends UIResponder, implements UIApplicationDelegate {
	
	public var window :UIWindow;
	public var viewController :UIViewController;
	public var view :UIView;
	public var label :UILabel;
	
	
	public function applicationDidFinishLaunchingWithOptions (application:UIApplication, didFinishLaunchingWithOptions:NSDictionary) :Bool {
		
		window = new UIWindow();
		var screen = UIScreen.mainScreen();
		window.frame = screen.bounds;
		
		view = new UIView();
		view.frame = new CGRect(0, 0, window.frame.size.width, window.frame.size.height);
		view.autoresizesSubviews = true;
		view.autoresizingMask = UIViewAutoresizing.flexibleWidth | UIViewAutoresizing.flexibleHeight;
		view.backgroundColor = UIColor.darkGrayColor();

		label = new UILabel();
		label.frame = new CGRect (0, 350, view.frame.size.width, 50);
		label.textColor = UIColor.yellowColor();
		label.backgroundColor = UIColor.clearColor();
		untyped __objc__("label.textAlignment = NSTextAlignmentCenter");
		label.font = UIFont.boldSystemFontOfSize(30);
		label.text = "Hello world!";
		view.addSubview(label);

		var map = new CustomMapView();
		map.frame = new CGRect(10, 10, 300, 300);
		map.locateLondon();
		map.locate (50.8, -0.5, 1.2);
		view.addSubview(map);

		viewController = new UIViewController();
		viewController.view = view;
		window.rootViewController = viewController;
		window.makeKeyAndVisible();
		
		return true;
	}
	public function applicationDidBecomeActive (application:UIApplication) :Void {}
	public function applicationWillResignActive (application:UIApplication) :Void {}
}
