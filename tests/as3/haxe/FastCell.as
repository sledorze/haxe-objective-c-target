package haxe {
	import flash.Boot;
	public class FastCell {
		public function FastCell(elt : * = null,next : haxe.FastCell = null) : void { if( !flash.Boot.skip_constructor ) {
			this.elt = elt;
			this.next = next;
		}}
		
		public var next : haxe.FastCell;
		public var elt : *;
	}
}
