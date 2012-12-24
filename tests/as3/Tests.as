package  {
	import haxe.FastList_Int;
	import haxe.Timer;
	import haxe.Log;
	public class Tests implements Interface2, Interface1{
		public function Tests() : void {
		}
		
		public function printHello() : void {
			haxe.Log._trace("Hello from Haxe Objective-C",{ fileName : "Tests.hx", lineNumber : 594, className : "Tests", methodName : "printHello"});
		}
		
		public function init() : void {
			var x : int = 6;
			this.s = "init";
		}
		
		public function optionalArguments3(arg1 : int,arg2 : int = 6,arg3 : * = null,arg4 : int) : void {
		}
		
		public function optionalArguments2(arg1 : int,arg2 : * = null,arg3 : * = null,arg4 : int) : void {
		}
		
		public function optionalArguments1(arg1 : int,arg2 : int,arg3 : int,arg4 : int = 5) : void {
		}
		
		public function optionalArguments(arg1 : int,arg2 : int,arg3 : int,arg4 : * = null) : void {
		}
		
		public function callLotsOfArguments(arg1 : int,arg2 : int,arg3 : int,arg4 : int) : void {
		}
		
		public function minus(a : int,b : int) : int {
			return a - b;
		}
		
		public function add(a : int,b : int) : int {
			return a + b;
		}
		
		public function setWidth(v : int) : int {
			return 0;
		}
		
		public function getWidth() : int {
			return 0;
		}
		
		protected function testFrameworksImport() : void {
		}
		
		protected function testTimer() : void {
			var _g : Tests = this;
			var timer : haxe.Timer = new haxe.Timer(50);
			timer.run = this.testXml;
			timer.stop();
			timer = haxe.Timer.delay(this.testTimer,50);
			timer = haxe.Timer.delay(function() : void {
				_g.testTimer();
			},50);
			haxe.Timer.measure(this.testTimer,{ fileName : "Tests.hx", lineNumber : 548, className : "Tests", methodName : "testTimer"});
			var f : Number = haxe.Timer.stamp();
		}
		
		protected function testXml() : void {
		}
		
		protected function testType() : void {
			var cl : Class = Type.resolveClass("ios.map.MKMapView");
		}
		
		protected function testString() : void {
			var string : String = new String("abcdefghijklmnopqrstuvwxyz");
			var len : int = string.length;
			var s : String = string.charAt(5);
			var ch : * = string["charCodeAtHX"](5);
			var i : int = string.indexOf("abc");
			var i1 : int = string.indexOf("abc",2);
			var li : int = string.lastIndexOf("abc");
			var components : Array = string.split("-");
			var s2 : String = string.substr(5);
			s2 = string.substr(5,len);
			s2 = string.substring(5);
			s2 = string.substring(1,len);
			s2 = string.toLowerCase();
			s2 = string.toUpperCase();
			s2 = string.toString();
			var s3 : String = "\t";
			var buf : StringBuf = new StringBuf();
			buf.add("abc");
			buf.addChar(18);
			buf.addSub("abcdefghijklmnopqerstuvwxyz",5);
			buf.addSub("abcdefghijklmnopqerstuvwxyz",5,10);
			var strbuf : String = buf.toString();
			var st : String = StringTools.urlEncode("http://imagin.ro/Gorgeous Elena/2");
			st = StringTools.urlDecode("http://imagin.ro/Gorgeous Elena/2");
			st = StringTools.htmlEscape("<a href= &>");
			st = StringTools.htmlUnescape("<a href= &>");
			st = StringTools.ltrim(" abcdefgh");
			st = StringTools.rtrim("abcdefgh ");
			st = StringTools.trim(" abcdefgh ");
			st = StringTools.rpad("abcdefgh","0",10);
			st = StringTools.lpad("abcdefgh","0",10);
			st = StringTools.replace("abcdefgh","abc","_abc");
			var b : Boolean = StringTools.startsWith("abcdefg","abc");
			b = StringTools.endsWith("abcdefg","efg");
			b = StringTools.isSpace("abcdefg",3);
			var i2 : String = StringTools.hex(345345,10);
			var sfin : String = strbuf + st;
			sfin = strbuf + st + s2;
			sfin += "abc";
			sfin = st + "abc" + 5;
			sfin = 55 + "abc";
		}
		
		protected function testStd() : void {
			var _int : int = 3;
			var BOOL : Boolean = Std._is(this.d1,Number);
			var float : Number = Std._parseFloat("55454.65");
			_int = Std._parseInt("435345.23");
			_int = Std.random(543);
			var string : String = Std.string(_int);
		}
		
		protected function testReflect() : void {
			var obj : * = { a : "aaaaa"}
			var b : Boolean = Reflect.hasField(obj,"a");
			var f : * = Reflect.field(obj,"a");
			Reflect.setField(obj,"a","bbbbb");
			Reflect.setProperty(this,"interfaceVar1","bbbbb");
			var p : * = Reflect.getProperty(this,"interfaceVar1");
			Reflect.callMethod(this,this.testStd,[]);
			Reflect.callMethod(this,this.callLotsOfArguments,[1,2,3,4]);
			var fs : Array = Reflect.fields(obj);
			var isf : Boolean = Reflect.isFunction(this.testStd);
			var i : int = Reflect.compare(1,2);
			var cm : Boolean = Reflect.compareMethods(this.testStd,this.testString);
			var isobj : Boolean = Reflect.isObject(obj);
			isobj = Reflect.isObject(this.testStd);
			Reflect.deleteField(obj,"a");
			var obj2 : * = Reflect.copy(obj);
		}
		
		protected function testMath() : void {
			var pi : Number = Math.PI;
			var max : Number = Math["NEGATIVE_INFINITY"];
			var min : Number = Math["POSITIVE_INFINITY"];
			var nan : Number = Math["NaN"];
			var x : Number = Math.sqrt(5);
			x = Math.abs(5);
			x = Math.max(5,45555);
			x = Math.min(5,45555);
			x = Math.sin(5);
			x = Math.cos(5);
			x = Math.atan2(5,3);
			x = Math.tan(5);
			x = Math.exp(5);
			x = Math.log(5);
			x = Math.sqrt(5);
			var xr : int = Math.round(5);
			xr = Math.floor(5);
			xr = Math.ceil(5);
			x = Math.atan(5);
			x = Math.asin(5);
			x = Math.acos(5);
			x = Math.pow(5,4);
			x = Math.random() * 5;
			var b : Boolean = Math["isFinite"](45454);
			b = Math["isNaN"](45454);
			var j : Number = x + xr;
			j += x;
			var k : Number = ((b)?-x:x);
		}
		
		protected function testList() : void {
			var l : List = new List();
			l.add(2);
			l.push(18);
			var l2 : List = l.filter(function(i : int) : Boolean {
				return i > 5;
			});
			var item : * = l.first();
			var empty : Boolean = l.isEmpty();
			var iter : * = l.iterator();
			var s : String = l.join(", ");
			s = l.toString();
			item = l.last();
			item = l.pop();
			var r : Boolean = l.remove(5);
			haxe.Log._trace(l.length,{ fileName : "Tests.hx", lineNumber : 314, className : "Tests", methodName : "testList"});
			l.clear();
			haxe.Log._trace(l.length,{ fileName : "Tests.hx", lineNumber : 316, className : "Tests", methodName : "testList"});
			var newList : List = l.map(function(i1 : int) : String {
				return Std.string(i1);
			});
			var fl : haxe.FastList_Int = new haxe.FastList_Int();
			fl.add(8);
		}
		
		protected function testLambda() : void {
			var a : Array = Lambda.array([0,1,2,3]);
			var l : List = Lambda.concat([0,1,2,3],[4,5]);
		}
		
		protected function testHash() : void {
			var h : Hash = new Hash();
			h.set("key","value");
			h.get("key");
			h.remove("key");
			var b : Boolean = h.exists("key");
			var arr : * = h.keys();
			var iter : * = h.iterator();
			var str : String = h.toString();
			var hi : IntHash = new IntHash();
			hi.set(0,"value");
			hi.get(0);
			hi.remove(0);
			var bi : Boolean = hi.exists(0);
			var arri : * = hi.keys();
			var iteri : * = hi.iterator();
			var stri : String = hi.toString();
		}
		
		protected function testEReg() : void {
			var ereg : EReg = new EReg("ytrytrevev76","099");
			var s : String = ereg.customReplace("s",function(e : EReg) : String {
				return "ss";
			});
			var b : Boolean = ereg.match("s");
			s = ereg.matched(5);
			s = ereg.matchedLeft();
			var o : * = ereg.matchedPos();
			s = ereg.matchedRight();
			s = ereg.replace("s","by");
			var arr : Array = ereg.split(",");
		}
		
		protected function testEnum(v : Object) : void {
			var i : int = (function($this:Tests) : int {
				var $r : int;
				{
					var $e2 : enum = (v);
					switch( $e2.index ) {
					case 0:
					$r = 5;
					break;
					case 1:
					$r = 6;
					break;
					case 2:
					$r = 7;
					break;
					}
				}
				return $r;
			}(this));
			var red : Color2 = Color2.Red2;
			var j : int = (function($this:Tests) : int {
				var $r3 : int;
				{
					var $e4 : enum = (red);
					switch( $e4.index ) {
					case 0:
					$r3 = 5;
					break;
					case 1:
					$r3 = 6;
					break;
					case 2:
					$r3 = 7;
					break;
					}
				}
				return $r3;
			}(this));
		}
		
		protected function enumToInt(c : Color) : int {
			this.testEnum(TestsEnumExtern.ExternEnumValue1);
			return (function($this:Tests) : int {
				var $r : int;
				{
					var $e2 : enum = (c);
					switch( $e2.index ) {
					case 0:
					$r = 16711680;
					break;
					case 1:
					$r = 65280;
					break;
					case 2:
					$r = 255;
					break;
					case 3:
					var v : int = $e2.params[0];
					$r = ((v << 16 | v << 8) | v);
					break;
					case 4:
					var b : int = $e2.params[2], g : int = $e2.params[1], r : int = $e2.params[0];
					$r = ((r << 16 | g << 8) | b);
					break;
					case 5:
					var c1 : Color = $e2.params[1], a : int = $e2.params[0];
					$r = (a << 24 | ($this.enumToInt(c1) & 16777215));
					break;
					}
				}
				return $r;
			}(this));
		}
		
		protected function testDate() : void {
			var d : Date = new Date(2012,11,13,19,30,0);
			var d2 : Date = Date["now"]();
			var x : int = DateTools.getMonthDays(d2);
		}
		
		protected function testArray() : void {
			var _as : Array = new Array();
			var aa : Array = [1.0,2,3,4,5];
			var aaa : Number = aa[2];
			aa[3];
			var concatArray : Array = _as.concat(["5","6","7"]);
			concatArray = _as.copy();
			concatArray.insert(2,"2");
			var iter : * = _as.iterator();
			var s : String = concatArray.join(", ");
			var item : String = _as.pop();
			_as.push("454");
			var bool : Boolean = _as.remove("5");
			_as.reverse();
			item = _as.shift();
			var sliceArray : Array = _as.slice(1,3);
			_as.sort(function(a : String,b : String) : int {
				return 0;
			});
			sliceArray = _as.splice(2,2);
			s = _as.toString();
			_as.unshift("44");
		}
		
		protected function testSwitch() : void {
			switch(true) {
			case true:
			{
				var x : int = 0;
			}
			break;
			case false:
			{
				var y : int = 0;
			}
			break;
			}
		}
		
		protected function testTry() : void {
			try {
				var a : int = 3;
			}
			catch( e : * ){
				haxe.Log._trace("error",{ fileName : "Tests.hx", lineNumber : 110, className : "Tests", methodName : "testTry"});
			}
		}
		
		protected function testWhile() : void {
			var aa : int = 5;
			do {
				haxe.Log._trace("do something",{ fileName : "Tests.hx", lineNumber : 93, className : "Tests", methodName : "testWhile"});
				aa++;
			} while(aa < 10);
			while(aa > 0) aa--;
		}
		
		protected function testingFor() : void {
			var aa : Array = [1,2,3,4,5];
			{
				var _g : int = 0;
				while(_g < 5) {
					var i : int = _g++;
					aa.push(i);
				}
			}
			{
				var _g1 : int = 0, _g2 : int = aa.length;
				while(_g1 < _g2) {
					var i1 : int = _g1++;
					aa.push(i1);
				}
			}
			{
				var _g3 : int = 0;
				while(_g3 < aa.length) {
					var i2 : int = aa[_g3];
					++_g3;
					aa.push(i2);
				}
			}
		}
		
		protected function testVariables() : void {
			var a : Array = new Array();
			var b : int = 5;
			var c : Number = 5.0;
			var d : String = "xyz";
			var e : Boolean = true;
			var f : int;
			var g : int = (function($this:Tests) : int {
				var $r : int;
				var $t : Number = 5.3;
				if(Std._is($t,int)) (($t) as int);
				else throw "Class cast error";
				$r = $t;
				return $r;
			}(this));
			var g1 : * = 6.3;
			var g2 : * = a;
			var xy : int = a.length;
			a.push("6");
			if(a.length > 3) f = 3;
			else f = a.length;
			f = ((a.length > 3)?3:a.length);
			var x : int = new Tests().add(1,1);
		}
		
		protected var s : String = "str";
		protected var d2 : Number = 4.5;
		protected var d1 : int = 34;
		public function get width() : int { return getWidth(); }
		public function set width( __v : int ) : void { setWidth(__v); }
		protected var $width : int;
		public var interfaceVar2 : Number;
		public var interfaceVar1 : int;
		static public var staticVar1 : String = "abcd";
		static public var staticVar2 : int = 5;
		static public var staticVar3 : int = 5;
		static public function main() : void {
		}
		
	}
}
