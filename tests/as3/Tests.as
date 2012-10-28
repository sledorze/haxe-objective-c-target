package  {
	import haxe.Log;
	public class Tests implements Interface2, Interface1{
		public function Tests() : void {
		}
		
		public function printHello() : void {
			haxe.Log._trace("Hello from Haxe Objective-C",{ fileName : "Tests.hx", lineNumber : 67, className : "Tests", methodName : "printHello"});
		}
		
		public function callLotsOfArguments(arg1 : int,_ : int,arg3 : int,arg4 : int) : void {
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
		
		protected function tests() : void {
			var a : Array = new Array();
			var aa : Array = [1,2,3,4,5];
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
			var xy : int = a.length;
			a.push("6");
			if(a.length > 3) f = 3;
			else f = a.length;
			f = ((a.length > 3)?3:a.length);
			var x : int = new Tests().add(1,1);
		}
		
		public function get width() : int { return getWidth(); }
		public function set width( __v : int ) : void { setWidth(__v); }
		protected var $width : int;
		public var interfaceVar2 : Number;
		public var interfaceVar1 : int;
		static public function main() : void {
		}
		
	}
}
