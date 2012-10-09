// File generated with the new Haxe objective-c target.
//
	public class Std {
		static public (BOOL) _isv:(**)v t:(**)t{
			return __global__.__instanceof(v,t);
		}
		
		static public (NSString) strings:(**)s{
			return ((s == nil)?@"null":s.toString());
		}
		
		static public (NSNumber) _intx:(NSNumber*)x{
			return __global__.__int__(x);
		}
		
		static public (*) _parseIntx:(NSString*)x{
			return __global__.__hxcpp_parse_int(x);
		}
		
		static public (NSNumber) _parseFloatx:(NSString*)x{
			return __global__.__hxcpp_parse_float(x);
		}
		
		static public (NSNumber) randomx:(NSNumber*)x{
			return __global__.rand() % x;
		}
		
	}
}
