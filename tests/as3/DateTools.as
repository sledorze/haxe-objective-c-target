package  {
	public class DateTools {
		static protected function __format_get(d : Date,e : String) : String {
			return function() : String {
				var $r : String;
				switch(e) {
				case "%":
				$r = "%";
				break;
				case "C":
				$r = StringTools.lpad(Std.string(Std._int(d.getFullYear() / 100)),"0",2);
				break;
				case "d":
				$r = StringTools.lpad(Std.string(d.getDate()),"0",2);
				break;
				case "D":
				$r = DateTools.__format(d,"%m/%d/%y");
				break;
				case "e":
				$r = Std.string(d.getDate());
				break;
				case "H":case "k":
				$r = StringTools.lpad(Std.string(d.getHours()),((e == "H")?"0":" "),2);
				break;
				case "I":case "l":
				$r = function() : String {
					var $r2 : String;
					var hour : int = d.getHours() % 12;
					$r2 = StringTools.lpad(Std.string(((hour == 0)?12:hour)),((e == "I")?"0":" "),2);
					return $r2;
				}();
				break;
				case "m":
				$r = StringTools.lpad(Std.string(d.getMonth() + 1),"0",2);
				break;
				case "M":
				$r = StringTools.lpad(Std.string(d.getMinutes()),"0",2);
				break;
				case "n":
				$r = "\n";
				break;
				case "p":
				$r = ((d.getHours() > 11)?"PM":"AM");
				break;
				case "r":
				$r = DateTools.__format(d,"%I:%M:%S %p");
				break;
				case "R":
				$r = DateTools.__format(d,"%H:%M");
				break;
				case "s":
				$r = Std.string(Std._int(d.getTime() / 1000));
				break;
				case "S":
				$r = StringTools.lpad(Std.string(d.getSeconds()),"0",2);
				break;
				case "t":
				$r = "\t";
				break;
				case "T":
				$r = DateTools.__format(d,"%H:%M:%S");
				break;
				case "u":
				$r = function() : String {
					var $r3 : String;
					var t : int = d.getDay();
					$r3 = ((t == 0)?"7":Std.string(t));
					return $r3;
				}();
				break;
				case "w":
				$r = Std.string(d.getDay());
				break;
				case "y":
				$r = StringTools.lpad(Std.string(d.getFullYear() % 100),"0",2);
				break;
				case "Y":
				$r = Std.string(d.getFullYear());
				break;
				default:
				$r = function() : String {
					var $r4 : String;
					throw "Date.format %" + e + "- not implemented yet.";
					return $r4;
				}();
				break;
				}
				return $r;
			}();
		}
		
		static protected function __format(d : Date,f : String) : String {
			var r : StringBuf = new StringBuf();
			var p : int = 0;
			while(true) {
				var np : int = f.indexOf("%",p);
				if(np < 0) break;
				r.addSub(f,p,np - p);
				r.add(DateTools.__format_get(d,f.substr(np + 1,1)));
				p = np + 2;
			}
			r.addSub(f,p,f.length - p);
			return r.toString();
		}
		
		static public function format(d : Date,f : String) : String {
			return DateTools.__format(d,f);
		}
		
		static public function delta(d : Date,t : Number) : Date {
			return Date["fromTime"](d.getTime() + t);
		}
		
		static protected var DAYS_OF_MONTH : Array = [31,28,31,30,31,30,31,31,30,31,30,31];
		static public function getMonthDays(d : Date) : int {
			var month : int = d.getMonth();
			var year : int = d.getFullYear();
			if(month != 1) return DateTools.DAYS_OF_MONTH[month];
			var isB : Boolean = year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
			return ((isB)?29:28);
		}
		
		static public function seconds(n : Number) : Number {
			return n * 1000.0;
		}
		
		static public function minutes(n : Number) : Number {
			return n * 60.0 * 1000.0;
		}
		
		static public function hours(n : Number) : Number {
			return n * 60.0 * 60.0 * 1000.0;
		}
		
		static public function days(n : Number) : Number {
			return n * 24.0 * 60.0 * 60.0 * 1000.0;
		}
		
		static public function parse(t : Number) : * {
			var s : Number = t / 1000;
			var m : Number = s / 60;
			var h : Number = m / 60;
			return { ms : t % 1000, seconds : Std._int(s % 60), minutes : Std._int(m % 60), hours : Std._int(h % 24), days : Std._int(h / 24)}
		}
		
		static public function make(o : *) : Number {
			return o.ms + 1000.0 * (o.seconds + 60.0 * (o.minutes + 60.0 * (o.hours + 24.0 * o.days)));
		}
		
	}
}
