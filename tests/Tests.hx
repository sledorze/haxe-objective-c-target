// This class is used to test the various features of Haxe and study the generated code

import Tests3;

@:orientation("UIInterfaceOrientationPortrait")
@:orientation("UIInterfaceOrientationLandscapeLeft")
@:identifier("com.ralcr.HelloWorld")
@:owner("Baluta Cristian")
@:bundle_name("TestsWorld")
@:version("1.0.1")

enum Color {
	Red;
	Green;
	Blue;
	Grey( v : Int );
	Rgb( r : Int, g : Int, b : Int );
	Alpha( a : Int, col : Color );
}

extern enum TestsEnumExtern {
	ExternEnumValue1;
	ExternEnumValue2;
	ExternEnumValue3;
}

typedef NewType = {
	var x:Int;
	var y:Int;
}

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
		
		#if objc
		objc.Lib.print("print print and print again");
		objc.Lib.println("print print and print again");
		#end
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
			trace("do something");
			aa ++;
		}
		while (aa < 10);
		
		while (aa > 0) {
			aa--;
		}
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
		
		var concatArray = as.concat ( ["5","6","7"]);
		concatArray = as.copy();
		concatArray.insert (2, "2");
		var iter = as.iterator();
		var s = concatArray.join(", ");
		var item = as.pop();
		as.push ("454");
		var bool = as.remove ("5");
		as.reverse();
		item = as.shift();
		var sliceArray = as.slice (1, 3);
		as.sort ( function(a:String, b:String):Int { return 0; } );
		sliceArray = as.splice (2, 2);
		s = as.toString();
		as.unshift ("44");
	}
	
	
	// Date
	
	function testDate (){
		var d = new Date (2012,11,13, 19,30,0);
		var int = d.getDate();
		int = d.getDay();
		int = d.getFullYear();
		int = d.getHours();
		int = d.getMinutes();
		int = d.getMonth();
		int = d.getSeconds();
		var float = d.getTime();
		var str = d.toString();
		var d2 = Date.fromString("2012-12-12 06:40:00");
		d2 = Date.fromTime(120000);
		d2 = Date.now();
		
		var x = DateTools.getMonthDays ( d2 );
		float = DateTools.days ( 5 );
		var d3 = DateTools.delta (d, 1000.0);
		str = DateTools.format (d, "HH:mm");
		int = DateTools.getMonthDays (d);
		float = DateTools.hours (1000);
		float = DateTools.make ( { seconds:0, ms:110, minutes:6, hours:8, days:5 } );
		float = DateTools.minutes(56);
		var obj = DateTools.parse(45546);
		float = DateTools.seconds(1000);
	}
	
	
	
	// Test Enum
	
	function enumToInt (c:Color) :Int {
		
		testEnum ( ExternEnumValue1 );
		
		return switch( c ) {
			case Red: 0xFF0000;
			case Green: 0x00FF00;
			case Blue: 0x0000FF;
			case Grey(v): (v << 16) | (v << 8) | v;
			case Rgb(r,g,b): (r << 16) | (g << 8) | b;
			case Alpha(a,c): (a << 24) | (enumToInt(c) & 0xFFFFFF);
		}
	}
	function testEnum (v:TestsEnumExtern) {
		var i = switch (v) {
			case ExternEnumValue1 : 5;
			case ExternEnumValue2 : 6;
			case ExternEnumValue3 : 7;
		}
		var red :Color2 = Red2;
		var j = switch (red) {
			case Red2 : 5;
			case Green2 : 6;
			case Blue2 : 7;
		}
	}
	
	
	
	// Test EReg
	
	function testEReg(){
		var ereg = new EReg("ytrytrevev76", "099");
		var s = ereg.customReplace("s", function(e:EReg):String{return "ss";});
		var b = ereg.match("s");
		s = ereg.matched(5);
		s = ereg.matchedLeft();
		var o = ereg.matchedPos();
		s = ereg.matchedRight();
		s = ereg.replace("s", "by");
		var arr = ereg.split(",");
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
		var a :Array<Int> = Lambda.array ([0,1,2,3]);
		var l = Lambda.concat ([0,1,2,3], [4,5]);
/*		 count<A>(it : Iterable<A>, ?pred : A -> Bool) : Int
		 empty(it : Iterable<Dynamic>) : Bool
		 exists<A>(it : Iterable<A>, f : A -> Bool) : Bool
		 filter<A>(it : Iterable<A>, f : A -> Bool) : List<A>
		 fold<A, B>(it : Iterable<A>, f : A -> B -> B, first : B) : B
		 foreach<A>(it : Iterable<A>, f : A -> Bool) : Bool
		 has<A>(it : Iterable<A>, elt : A, ?cmp : A -> A -> Bool) : Bool
		 indexOf<T>(it : Iterable<T>, v : T) : Int
		 iter<A>(it : Iterable<A>, f : A -> Void) : Void
		 list<A>(it : Iterable<A>) : List<A>
		 map<A, B>(it : Iterable<A>, f : A -> B) : List<B>
		 mapi<A, B>(it : Iterable<A>, f : Int -> A -> B) : List<B>*/
	}
	
	
	
	// Test List
	
	function testList(){
		var l = new List<Int>();
		l.add(2);
		l.push(18);
		var l2 = l.filter( function(i:Int):Bool{ return i>5; } );
		var item = l.first();
		var empty = l.isEmpty();
		var iter = l.iterator();
		var s = l.join(", ");
		s = l.toString();
		item = l.last();
		item = l.pop();
		var r = l.remove ( 5 );
		trace(l.length);
		l.clear();
		trace(l.length);
		
		var newList = l.map ( function(i:Int):String { return Std.string(i); } );
		
		var fl = new haxe.FastList<Int>();
		fl.add(8);
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
		Reflect.callMethod (this, testStd, []);
		Reflect.callMethod (this, callLotsOfArguments, [1,2,3,4]);
		var fs = Reflect.fields ( obj );
		var isf = Reflect.isFunction ( testStd );
		var i = Reflect.compare ( 1, 2 );
		var cm = Reflect.compareMethods ( testStd, testString );
		var isobj = Reflect.isObject ( obj );
		isobj = Reflect.isObject ( testStd );
		Reflect.deleteField ( obj, "a" );
		var obj2 = Reflect.copy ( obj );
		// makeVarArgs
	}
	
	
	
	// Test Std
	
	function testStd () {
		var int = Std.int (3.5);
		var BOOL = Std.is (d1, Float);
		var float = Std.parseFloat("55454.65");
		int = Std.parseInt("435345.23");
		int = Std.random(543);
		var string = Std.string(int);
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
		sfin = st + "abc" + 5;
		sfin = 55 + "abc";
	}
	
	
	
	// Test Sys
	#if objc
	function testSys () {
		Sys.print("hello world");
		Sys.println("hello world");
		var arr = Sys.args();
		var int = Sys.command ("cd", ["~"]);
		int = Sys.command ("ls", []);
		var float = Sys.cpuTime();
		var hash = Sys.environment();
		var string = Sys.executablePath();
		Sys.exit(0);
		int = Sys.getChar ( true );
		string = Sys.getCwd();
		string = Sys.getEnv ("VAR1");
		Sys.putEnv ("VAR1", "val 1");
		Sys.setCwd ("thisdir");
		var bool = Sys.setTimeLocale ("loc");
		Sys.sleep (5.5);
		
		var _out = Sys.stderr();
		var _in = Sys.stdin();
		_out = Sys.stdout();
		
		string = Sys.systemName();
		float = Sys.time();
	}
	#end
	
	// Test Type
	
	function testType () {
		#if objc
		var sup = Type.getSuperClass ( objc.foundation.NSString );
		var sups = Type.getClassName ( objc.foundation.NSString );
		#end
		var cl = Type.resolveClass ( "ios.map.MKMapView" );
		
/*		allEnums<T>(e : Enum<T>) : Array<T>
		Returns the list of all enum values that dont take any parameter.
		static function createEmptyInstance<T>(cl : Class<T>) : T
		Similar to Reflect.createInstance excepts that the constructor is not called. This enables you to create an instance without any side-effect.
		static function createEnum<T>(e : Enum<T>, constr : String, ?params : Array<Dynamic>) : T
		Create an instance of an enum by using a constructor name and parameters.
		static function createEnumIndex<T>(e : Enum<T>, index : Int, ?params : Array<Dynamic>) : T
		Create an instance of an enum by using a constructor index and parameters.
		static function createInstance<T>(cl : Class<T>, args : Array<Dynamic>) : T
		Creates an instance of the given class with the list of constructor arguments.
		static function enumConstructor(e : EnumValue) : String
		Returns the constructor of an enum
		static function enumEq<T>(a : T, b : T) : Bool
		Recursively compare two enums constructors and parameters.
		static function enumIndex(e : EnumValue) : Int
		Returns the index of the constructor of an enum
		static function enumParameters(e : EnumValue) : Array<Dynamic>
		Returns the parameters of an enum
		static function getClass<T>(o : T) : Class<T>
		Returns the class of a value or null if this value is not a Class instance.
		static function getClassFields(c : Class<Dynamic>) : Array<String>
		Returns the list of a class static fields.
		static function getClassName(c : Class<Dynamic>) : String
		Returns the complete name of a class.
		static function getEnum(o : EnumValue) : Enum<Dynamic>
		Returns the enum of a value or null if this value is not an Enum instance.
		static function getEnumConstructs(e : Enum<Dynamic>) : Array<String>
		Returns all the available constructor names for an enum.
		static function getEnumName(e : Enum<Dynamic>) : String
		Returns the complete name of an enum.
		static function getInstanceFields(c : Class<Dynamic>) : Array<String>
		Returns the list of instance fields.
		static function getSuperClass(c : Class<Dynamic>) : Class<Dynamic>
		Returns the super-class of a class, or null if no super class.
		static function resolveClass(name : String) : Class<Dynamic>
		Evaluates a class from a name. The class must have been compiled to be accessible.
		static function resolveEnum(name : String) : Enum<Dynamic>
		Evaluates an enum from a name. The enum must have been compiled to be accessible.
		static function typeof(v : Dynamic) : ValueType*/
	}
	
	
	
	
	// Test Xml
	
	function testXml () {
		//var xml = Xml.parse("<xml>");
	}
	
	
	
	
	// Test haxe.Timer
	#if !cpp
	function testTimer () {
		var timer = new haxe.Timer ( 50 );
		timer.run = testXml;
		timer.stop();
		timer = haxe.Timer.delay (testTimer, 50);
		timer = haxe.Timer.delay ( function() { testTimer(); }, 50);
		haxe.Timer.measure (testTimer);
		var f = haxe.Timer.stamp();
	}
	#end
	
	
	// Framework import. If you use MKMapView the objc target will import the MapKit framework entirely
	
	function testFrameworksImport(){
		// When using native classes do not call 'new' method but call 'init': [[MKMapView alloc] init]
		//var m = new ios.map.MKMapView();
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

class Tests2 {
	var d1 = 34;
	function new () {
		var arr = [d1, d1, 50];
	}
	function methodInTests2(){}
}
enum Color2 {
	Red2;
	Green2;
	Blue2;
}
