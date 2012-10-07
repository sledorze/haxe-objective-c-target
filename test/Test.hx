import Date;

class Test {
	
	public var float1 :Float;// Generate a @property (nonatomic) NSNumber *float1; + a @synthesizer
	public var width (getWidth, setWidth) :Int;// Generate a @property (nonatomic, getter=getWidth, setter=setWidth) + a @synthesizer
	
	public static function main(){
		trace("Hello world from haxe sources");
		
/*		var x = "xyz";
		trace(Std.format("Hello with variable $x"));*/
		
		var a = new Array<String>();
		var aa = [1, 2, 3, 4, 5];
		var b :Int = 5;
		var c :Float = 5.0;
		var d = "abcdefghijkl";
		var e = true;
		var f:Int;
		
		var webView = new objc.ios.UIWebView();
			webView.initWithFrame();
			
			for (i in aa) {
				a.push (Std.string(i));
			}
	}
	
	function functionHeaderWithParams (c:Bool, abc:Int, def:Float, ghi:String) :Int {
		return c ? 1 : 0;
	}
	
	function getWidth():Int{return 0;}
	function setWidth(v:Int):Int{return 0;}
}
