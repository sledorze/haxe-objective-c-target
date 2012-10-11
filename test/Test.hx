import Date;

class Test extends objc.ios.UIWebView, implements TestInterface {
	
	public var interfaceVar1 :Int;// Generate a @property (nonatomic, strong) NSNumber *float1; + a @synthesizer
	public var interfaceVar2 :Float;
	public var width (getWidth, setWidth) :Int;// Generate a @property (nonatomic, getter=getWidth, setter=setWidth) + a @synthesizer
	
	public static function main(){
		
/*		var x = "xyz";
		trace(Std.format("Hello with variable $x"));*/
		
		// declare some random variables
		var a = new Array<String>();
		var aa = [1, 2, 3, 4, 5];
		var b :Int = 5;
		var c :Float = 5.0;
		var d = "abcdefghijkl";
		var e = true;
		var f :Int;
		
		for (i in aa) {
			a.push (Std.string(i));
		}
		
		var x = add (1, 1);
		
		var webView = new objc.ios.UIWebView();
			webView.initWithFrame();
	}
	
	function getWidth():Int{return 0;}
	function setWidth(v:Int):Int{return 0;}
	
	
	
	public function add (a:Int, b:Int) :Int {
		return a+b;
	}
	public function printHello () :Void {
		trace("Hello from Haxe Objective-C");
	}
}
