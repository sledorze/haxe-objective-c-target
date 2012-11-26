// This class is used to test the various features of Haxe and study the generated code

import objc.ios.Lib;

@:orientation("UIInterfaceOrientationPortrait")
@:orientation("UIInterfaceOrientationLandscapeLeft")
@:identifier("com.ralcr.HelloWorld")
@:owner("Baluta Cristian")
@:bundle_name("HelloWorld")
@:version("1.0")


class Tests implements Interface1, implements Interface2 {
	
	public var interfaceVar1 :Int;// Generate a @property (nonatomic) int float1; + a @synthesize float1
	public var interfaceVar2 :Float;
	public var width (getWidth, setWidth) :Int;// Generate a @property (nonatomic, getter=getWidth, setter=setWidth) + a @synthesizer
	
	var d1 = 34;
	var d2 = 4.5;
	var s = "str";
	
	// Static vars
	public static var staticVar1 :String = "abcd";
	public static var staticVar2 :Int = 5;
	inline public static var staticVar3 :Int = 5;
	
	public function new () {
		// The constructor automaticall call the method init and init variables
	}
	
	function testVariables () :Void {
		// declare some random variables
		var a = new Array<String>();
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
		
		var x = new Tests().add (1, 1);// [[[Tests alloc] new] add:1 b:1]
		
		Lib.isIpad();
	}
	
	// For statements
	
	function testingFor(){
		var aa = [1, 2, 3, 4, 5];
		for (i in 0...5) aa.push ( i );
		for (i in 0...aa.length) aa.push ( i );
		for (i in aa) aa.push ( i );
	}
	
	// While statements
	
	function testWhile(){
		var aa = 5;
		do {
			trace("something");
			aa ++;
		}
		while (aa < 10);
	}
	
	// Try catch
	
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
	
	// Switch statement
	
	function testSwitch(){
		switch (true) {
			case true : var x = 0;
			case false : var y = 0;
		}
	}
	
	
	// Test Array
	
	function testArray(){
		var as = new Array<String>();
		var aa = [1.0, 2, 3, 4, 5];
		var aaa = aa[2];
		aa[3];
	}
	
	// Date
	
	function testDate (){
		var d = new Date (2012,11,13, 19,30,0);
		var d2 = Date.now();
		
		var x = DateTools.getMonthDays ( d2 );
		
	}
	
	
	
	// Test Enum
	
	function testEnum(){
		
	}
	
	
	
	// Test EReg
	
	function testEReg(){
		
	}
	
	
	// Test Hashes
	
	function testHash () {
		var h = new Hash<String>();// NSMutableDictionary
			h.set ("key", "value");
			h.get ("key");
			h.remove ("key");
		var b = h.exists ("key");
		var arr = h.keys();
		var iter = h.iterator();
		var str = h.toString();
		
		var hi = new IntHash<String>();
			hi.set (0, "value");
			hi.get (0);
			hi.remove (0);
		var bi = hi.exists (0);
		var arri = hi.keys();
		var iteri = hi.iterator();
		var stri = hi.toString();
	}
	
	
	
	// Test Lambda
	
	function testLambda(){
		
	}
	
	
	
	// Test List
	
	function testList(){
		
	}
	
	
	
	// Test Math
	
	function testMath(){
		var pi = Math.PI;
		var max = Math.NEGATIVE_INFINITY;
		var min = Math.POSITIVE_INFINITY;
		var nan = Math.NaN;
		
		var x = Math.sqrt(5);
		x = Math.abs(5);
		x = Math.max (5, 45555);
		x = Math.min (5, 45555);
		x = Math.sin(5);
		x = Math.cos(5);
		x = Math.atan2(5, 3);
		x = Math.tan(5);
		x = Math.exp(5);
		x = Math.log(5);
		x = Math.sqrt(5);
		var xr = Math.round(5);
		xr = Math.floor(5);
		xr = Math.ceil(5);
		x = Math.atan(5);
		x = Math.asin(5);
		x = Math.acos(5);
		x = Math.pow(5, 4);
		x = Math.random()*5;
		var b = Math.isFinite (45454 );
		b = Math.isNaN (45454 );
		
		var j = x + xr;
		j += x;
		var k = b ? -x : x;
	}
	
	
	// Test Reflect
	
	function testReflect(){
		var obj = { a: "aaaaa" };
		var b = Reflect.hasField (obj, "a");
		var f = Reflect.field (obj, "a");
		Reflect.setField (obj, "a", "bbbbb");
		Reflect.setProperty (this, "interfaceVar1", "bbbbb");
		var p = Reflect.getProperty (this, "interfaceVar1");
	}
	
	
	
	// Test Std
	
	function testStd () {
	
	}
	
	
	// String and string operations
	
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
		
		var buf = new StringBuf();
		buf.add("abc");
		buf.addChar(18);
		buf.addSub("abcdefghijklmnopqerstuvwxyz", 5);
		buf.addSub("abcdefghijklmnopqerstuvwxyz", 5, 10);
		var strbuf = buf.toString();
		
		var st = StringTools.urlEncode ("http://imagin.ro/Gorgeous Elena/2");
		st = StringTools.urlDecode ("http://imagin.ro/Gorgeous Elena/2");
		st = StringTools.htmlEscape ("<a href= &>");
		st = StringTools.htmlUnescape ("<a href= &>");
		st = StringTools.ltrim (" abcdefgh");
		st = StringTools.rtrim ("abcdefgh ");
		st = StringTools.trim (" abcdefgh ");
		st = StringTools.rpad ("abcdefgh", "0", 10);
		st = StringTools.lpad ("abcdefgh", "0", 10);
		st = StringTools.replace ("abcdefgh", "abc", "_abc");
		var b = StringTools.startsWith ("abcdefg", "abc");
		b = StringTools.endsWith ("abcdefg", "efg");
		b = StringTools.isSpace ("abcdefg", 3);
		var i = StringTools.hex (345345, 10);
		
		var sfin = strbuf+st;
		sfin = strbuf+st+s2;
		sfin += "abc";
	}
	
	
	
	// Test Sys
	
	function testSys () {
	
	}
	
	
	// Test Type
	
	function testType () {
	
	}
	
	
	
	
	// Test Xml
	
	function testXml () {
	
	}
	
	
	
	// Framework import. If you use MKMapView the objc target will import the MapKit framework entirely
	
	function testFrameworksImport(){
		// When using native classes do not call 'new' method but call 'init': [[MKMapView alloc] init]
		var m = new objc.ios.map.MKMapView();
	}
	
	// Getter setter
	
	function getWidth():Int{return 0;}
	function setWidth(v:Int):Int{return 0;}
	
	
	
	// Interface methods
	
	public function add (a:Int, b:Int) :Int {
		return a+b;
	}
	public function minus (a:Int, b:Int) :Int {
		return a-b;
	}
	
	// Various methods
	
	public function callLotsOfArguments (arg1:Int, arg2:Int, arg3:Int, arg4:Int) :Void {}
	public function optionalArguments (arg1:Int, arg2:Int, arg3:Int, ?arg4:Int) :Void {}
	public function optionalArguments1 (arg1:Int, arg2:Int, arg3:Int, arg4:Int=5) :Void {}
	public function optionalArguments2 (arg1:Int, ?arg2:Int, ?arg3:Int, arg4:Int) :Void {}
	public function optionalArguments3 (arg1:Int, arg2:Int=6, ?arg3:Int, arg4:Int) :Void {}
	
	// When an init method is present make a call to super.init and make the new method to call this init instead the super.init
	public function init () {
		var x = 6;
		s = "init";
	}
	
	// Trace is converted to NSLog, but Lib.print is converted to C printf
	
	public function printHello () :Void {
		trace("Hello from Haxe Objective-C");
	}
	
	// The main entry point is converted to a main.m file
	
	public static function main() {
		//return new UIApplicationMain ( Tests );
	}
}
