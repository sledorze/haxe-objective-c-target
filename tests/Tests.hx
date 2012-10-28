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
	
	public function new () {
		
	}
	
	function tests () :Void {
		// declare some random variables
		var a = new Array<String>();
		var aa = [1, 2, 3, 4, 5];
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
		
/*		switch (e) {
			case true : null;
			case false : null;
		}*/
		
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
	
	function getWidth():Int{return 0;}
	function setWidth(v:Int):Int{return 0;}
	
	
	// Interface methods
	public function add (a:Int, b:Int) :Int {
		return a+b;
	}
	public function minus (a:Int, b:Int) :Int {
		return a-b;
	}
	public function callLotsOfArguments (arg1:Int, _:Int, arg3:Int, arg4:Int) :Void {}
	public function printHello () :Void {
		trace("Hello from Haxe Objective-C");
	}
	public static function main() {
		//return new UIApplicationMain ( Tests );
	}
}
