package haxe {
	import haxe.FastCell_Int;
	public class FastList_Int {
		public function FastList_Int() : void {
		}
		
		public function toString() : String {
			var a : Array = new Array();
			var l : haxe.FastCell_Int = this.head;
			while(l != null) {
				a.push(l.elt);
				l = l.next;
			}
			return "{" + a.join(",") + "}";
		}
		
		public function iterator() : * {
			var l : haxe.FastCell_Int = this.head;
			return { hasNext : function() : Boolean {
				return l != null;
			}, next : function() : int {
				var k : haxe.FastCell_Int = l;
				l = k.next;
				return k.elt;
			}}
		}
		
		public function remove(v : int) : Boolean {
			var prev : * = null;
			var l : haxe.FastCell_Int = this.head;
			while(l != null) {
				if(l.elt == v) {
					if(prev == null) this.head = l.next;
					else prev.next = l.next;
					break;
				}
				prev = l;
				l = l.next;
			}
			return l != null;
		}
		
		public function isEmpty() : Boolean {
			return this.head == null;
		}
		
		public function pop() : * {
			var k : haxe.FastCell_Int = this.head;
			if(k == null) return null;
			else {
				this.head = k.next;
				return k.elt;
			}
			return 0;
		}
		
		public function first() : * {
			return ((this.head == null)?null:this.head.elt);
		}
		
		public function add(item : int) : void {
			this.head = new haxe.FastCell_Int(item,this.head);
		}
		
		public var head : haxe.FastCell_Int;
	}
}
