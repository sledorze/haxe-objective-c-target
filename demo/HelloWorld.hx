import objc.ios.ui.UIApplicationMain;


@:orientation("portrait")
@:identifier("com.ralcr.HelloWorld")
@:bundle_name("HelloWorld")



class HelloWorld {
	
	// This is the standard way of starting an iOS app, and the only for now
	public static function main() {
		return new UIApplicationMain ( AppDelegate );
	}
	
	public static function unusedMain(){}
}
