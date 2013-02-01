package haxe.crypto {
	import haxe.io.Bytes;
	public class Sha1 {
		public function Sha1() : void {
		}
		
		public function hex(a : Array) : String {
			var str : String = "";
			var hex_chr : String = "0123456789abcdef";
			{
				var _g : int = 0;
				while(_g < a.length) {
					var num : int = a[_g];
					++_g;
					var j : int = 7;
					while(j >= 0) {
						str += hex_chr.charAt(num >>> (j << 2) & 15);
						j--;
					}
				}
			}
			return str;
		}
		
		protected function kt(t : int) : int {
			if(t < 20) return 1518500249;
			if(t < 40) return 1859775393;
			if(t < 60) return -1894007588;
			return -899497514;
		}
		
		protected function ft(t : int,b : int,c : int,d : int) : int {
			if(t < 20) return (b & c) | (~b & d);
			if(t < 40) return (b ^ c) ^ d;
			if(t < 60) return ((b & c) | (b & d)) | (c & d);
			return (b ^ c) ^ d;
		}
		
		protected function rol(num : int,cnt : int) : int {
			return num << cnt | num >>> 32 - cnt;
		}
		
		public function doEncode(x : Array) : Array {
			var w : Array = new Array();
			var a : int = 1732584193;
			var b : int = -271733879;
			var c : int = -1732584194;
			var d : int = 271733878;
			var e : int = -1009589776;
			var i : int = 0;
			while(i < x.length) {
				var olda : int = a;
				var oldb : int = b;
				var oldc : int = c;
				var oldd : int = d;
				var olde : int = e;
				var j : int = 0;
				while(j < 80) {
					if(j < 16) w[j] = x[i + j];
					else w[j] = this.rol(((w[j - 3] ^ w[j - 8]) ^ w[j - 14]) ^ w[j - 16],1);
					var t : int = this.rol(a,5) + this.ft(j,b,c,d) + e + w[j] + this.kt(j);
					e = d;
					d = c;
					c = this.rol(b,30);
					b = a;
					a = t;
					j++;
				}
				a += olda;
				b += oldb;
				c += oldc;
				d += oldd;
				e += olde;
				i += 16;
			}
			return [a,b,c,d,e];
		}
		
		static public function encode(s : String) : String {
			var sh : haxe.crypto.Sha1 = new haxe.crypto.Sha1();
			var h : Array = sh.doEncode(haxe.crypto.Sha1.str2blks(s));
			return sh.hex(h);
		}
		
		static public function make(b : haxe.io.Bytes) : haxe.io.Bytes {
			var h : Array = new haxe.crypto.Sha1().doEncode(haxe.crypto.Sha1.bytes2blks(b));
			var out : haxe.io.Bytes = haxe.io.Bytes.alloc(20);
			var p : int = 0;
			{
				var _g : int = 0;
				while(_g < 5) {
					var i : int = _g++;
					out.set(p++,h[i] >>> 24);
					out.set(p++,h[i] >> 16 & 255);
					out.set(p++,h[i] >> 8 & 255);
					out.set(p++,h[i] & 255);
				}
			}
			return out;
		}
		
		static protected function str2blks(s : String) : Array {
			var nblk : int = (s.length + 8 >> 6) + 1;
			var blks : Array = new Array();
			{
				var _g1 : int = 0, _g : int = nblk * 16;
				while(_g1 < _g) {
					var i : int = _g1++;
					blks[i] = 0;
				}
			}
			{
				var _g11 : int = 0, _g2 : int = s.length;
				while(_g11 < _g2) {
					var i1 : int = _g11++;
					var p : int = i1 >> 2;
					blks[p] |= s["charCodeAtHX"](i1) << 24 - ((i1 & 3) << 3);
				}
			}
			var i2 : int = s.length;
			var p1 : int = i2 >> 2;
			blks[p1] |= 128 << 24 - ((i2 & 3) << 3);
			blks[nblk * 16 - 1] = s.length * 8;
			return blks;
		}
		
		static protected function bytes2blks(b : haxe.io.Bytes) : Array {
			var nblk : int = (b.length + 8 >> 6) + 1;
			var blks : Array = new Array();
			{
				var _g1 : int = 0, _g : int = nblk * 16;
				while(_g1 < _g) {
					var i : int = _g1++;
					blks[i] = 0;
				}
			}
			{
				var _g11 : int = 0, _g2 : int = b.length;
				while(_g11 < _g2) {
					var i1 : int = _g11++;
					var p : int = i1 >> 2;
					blks[p] |= b.get(i1) << 24 - ((i1 & 3) << 3);
				}
			}
			var i2 : int = b.length;
			var p1 : int = i2 >> 2;
			blks[p1] |= 128 << 24 - ((i2 & 3) << 3);
			blks[nblk * 16 - 1] = b.length * 8;
			return blks;
		}
		
	}
}
