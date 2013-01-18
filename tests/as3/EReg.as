package  {
	import flash.Boot;
	public class EReg {
		public function EReg(r : String = null,opt : String = null) : void { if( !flash.Boot.skip_constructor ) {
			this.r = new RegExp(r,opt);
		}}
		
		public function customReplace(s : String,f : Function) : String {
			var offset : int = 0;
			var buf : StringBuf = new StringBuf();
			do {
				if(offset >= s.length) break;
				else if(!this.matchSub(s,offset)) {
					buf.add(s.substr(offset));
					break;
				}
				var p : * = this.matchedPos();
				buf.add(s.substr(offset,p.pos - offset));
				buf.add(f(this));
				if(p.len == 0) {
					buf.add(s.substr(p.pos,1));
					offset = p.pos + 1;
				}
				else offset = p.pos + p.len;
			} while(true);
			return buf.toString();
		}
		
		public function map(s : String,f : Function) : String {
			var offset : int = 0;
			var buf : StringBuf = new StringBuf();
			var first : Boolean = true;
			do {
				if(offset >= s.length) break;
				else if(!this.matchSub(s,offset)) {
					buf.add(s.substr(offset));
					break;
				}
				var p : * = this.matchedPos();
				buf.add(s.substr(offset,p.pos - offset));
				buf.add(f(this));
				if(p.len == 0) {
					buf.add(s.substr(p.pos,1));
					offset = p.pos + 1;
				}
				else offset = p.pos + p.len;
				first = false;
			} while(this.r.global);
			if(!this.r.global && offset < s.length) buf.add(s.substr(offset));
			return buf.toString();
		}
		
		public function replace(s : String,by : String) : String {
			return s.replace(this.r,by);
		}
		
		public function split(s : String) : Array {
			var d : String = "#__delim__#";
			var s1 : String = s.replace(this.r,d);
			return s1.split(d);
		}
		
		public function matchSub(s : String,pos : int,len : int = -1) : Boolean {
			return ((this.r.global)?(function($this:EReg) : Boolean {
				var $r : Boolean;
				$this.r.lastIndex = pos;
				$this.result = $this.r.exec(((len < 0)?s:s.substr(0,pos + len)));
				var b : Boolean = $this.result != null;
				if(b) $this.result.input = s;
				$r = b;
				return $r;
			}(this)):(function($this:EReg) : Boolean {
				var $r2 : Boolean;
				var b1 : Boolean = $this.match(((len < 0)?s.substr(pos):s.substr(pos,len)));
				if(b1) {
					$this.result.input = s;
					$this.result.index += pos;
				}
				$r2 = b1;
				return $r2;
			}(this)));
		}
		
		public function matchedPos() : * {
			if(this.result == null) throw "No string matched";
			return { pos : this.result.index, len : this.result[0].length}
		}
		
		public function matchedRight() : String {
			if(this.result == null) throw "No string matched";
			var rl : int = this.result.index + this.result[0].length;
			var s : String = this.result.input;
			return s.substr(rl,s.length - rl);
		}
		
		public function matchedLeft() : String {
			if(this.result == null) throw "No string matched";
			var s : String = this.result.input;
			return s.substr(0,this.result.index);
		}
		
		public function matched(n : int) : String {
			return ((this.result != null && n >= 0 && n < this.result.length)?this.result[n]:(function($this:EReg) : String {
				var $r : String;
				throw "EReg::matched";
				return $r;
			}(this)));
		}
		
		public function match(s : String) : Boolean {
			if(this.r.global) this.r.lastIndex = 0;
			this.result = this.r.exec(s);
			return this.result != null;
		}
		
		protected var result : *;
		public var r : RegExp;
	}
}
