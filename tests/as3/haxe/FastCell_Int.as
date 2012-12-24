package haxe {
	import flash.Boot;
	public class FastCell_Int {
		public function FastCell_Int(elt : int = 0,next : haxe.FastCell_Int = null) : void { if( !flash.Boot.skip_constructor ) {
			this.elt = elt;
			this.next = next;
		}}
		
		public var next : haxe.FastCell_Int;
		public var elt : int;
	}
}
