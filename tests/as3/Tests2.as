package  {
	import haxe.Log;
	import flash.Boot;
	public class Tests2 {
		public function Tests2() : void { if( !flash.Boot.skip_constructor ) {
			if(this.functionToRedefine2 == null) this.functionToRedefine2 = function(param1 : int,param2 : String) : void {
			}
			if(this.functionToRedefine == null) this.functionToRedefine = function() : void {
				haxe.Log._trace("originally do something",{ fileName : "Tests.hx", lineNumber : 626, className : "Tests2", methodName : "functionToRedefine"});
			}
			var arr : Array = [this.d1,this.d1,50];
		}}
		
		public var functionToRedefine2 : Function;
		public var functionToRedefine : Function;
		protected function methodInTests2() : void {
			this.functionToRedefine();
			this.functionToRedefine2(0,"00");
		}
		
		protected var d1 : int = 34;
	}
}
