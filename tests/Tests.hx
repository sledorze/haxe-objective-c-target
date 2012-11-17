@:orientation("UIInterfaceOrientationPortrait")
@:orientation("UIInterfaceOrientationLandscapeLeft")
@:identifier("com.ralcr.HelloWorld")
@:owner("Baluta Cristian")
@:bundle_name("HelloWorld")
@:version("1.0")


class Tests implements Interface1, implements Interface2 {
	
	public var interfaceVar1 :Int;// Generate a @property (nonatomic, strong) NSNumber *float1; + a @synthesizer
	public var interfaceVar2 :Float;
	public var width (getWidth, setWidth) :Int;// Generate a @property (nonatomic, getter=getWidth, setter=setWidth) + a @synthesizer
	
	public static var staticVar1 :String = "abcd";
	
	public function new () {
		
	}
	
	function tests () :Void {
		// declare some random variables
		var a = new Array<String>();
		var aa = [1.0, 2, 3, 4, 5];
		var aaa = aa[2];
		aa[3];
		var b :Int = 5;
		var c :Float = 5.0;
		var d = "xyz";
		var e = true;
		var f :Int;
		var g :Int = cast (5.3, Int);
		var g1 = cast (6.3);
		var g2 = cast (a);
		var xy = a.length;
		a.push ( "6" );
		
		if (a.length > 3) {
			f = 3;
		}
		else {
			f = a.length;
		}
		f = a.length > 3 ? 3 : a.length;
		
		var x = new Tests().add (1, 1);
	}
	function testingFor(){
		var aa = [1, 2, 3, 4, 5];
		for (i in 0...5) aa.push ( i );
		for (i in 0...aa.length) aa.push ( i );
		for (i in aa) aa.push ( i );
	}
	function testingWhile(){
		var aa = 5;
		do {
			trace("something");
			aa ++;
		}
		while (aa < 10);
	}
	function testTry () {
		try {
			var a = 1+2;
		}
		catch (e:Dynamic) {
			trace("error");
		}
		/*finally {
					trace("finally");
				}*/
	}
	function testSwitch(){
		switch (true) {
			case true : var x = 0;
			case false : var y = 0;
		}
	}
	function testDate (){
		var d = new Date (2012,11,13, 19,30,0);
		var d2 = Date.now();
		var x = DateTools.getMonthDays ( d2 );
	}
	function testString () {
		// Convert String API to NSString api
		var string = new String ("abcdefghijklmnopqrstuvwxyz");
		var len:Int = string.length;
		var s:String = string.charAt ( 5 );
		var ch:Null<Int> = string.charCodeAt ( 5 );
		var i:Int = string.indexOf ( "abc" );
		var i:Int = string.indexOf ( "abc", 2 );
		var li:Int = string.lastIndexOf ( "abc" );
		var components:Array<String> = string.split("-");
		var s2:String = string.substr(5);
		s2 = string.substr(5, len);
		s2 = string.substring(5);
		s2 = string.substring(1, len);
		s2 = string.toLowerCase();//
		s2 = string.toUpperCase();//
		s2 = string.toString();
		var s3:String = String.fromCharCode ( 9 );
	}
	function testFrameworksImport(){
		var m = new objc.ios.map.MKMapView();
	}
	function getWidth():Int{return 0;}
	function setWidth(v:Int):Int{return 0;}
	
	
	// Interface methods
	public function add (a:Int, b:Int) :Int {
		return a+b;
	}
	public function minus (a:Int, b:Int) :Int {
		return a-b;
	}
	public function callLotsOfArguments (arg1:Int, t:Int, t:Int, arg4:Int) :Void {}
	public function printHello () :Void {
		trace("Hello from Haxe Objective-C");
	}
	public static function main() {
		//return new UIApplicationMain ( Tests );
	}
}
