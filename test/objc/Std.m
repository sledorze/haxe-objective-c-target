//
// File generated with the Haxe Objective-C target.
//
	public class Std {
		+  (BOOL) _isv:(**)v t:(**)t{
			return __global__.__instanceof(v,t);
		}
		
		+  (NSString) strings:(**)s{
			return ((s == nil)?@"null":s.toString());
		}
		
		+  (NSNumber) _intx:(NSNumber*)x{
			return __global__.__int__(x);
		}
		
		+  (*) _parseIntx:(NSString*)x{
			return __global__.__hxcpp_parse_int(x);
		}
		
		+  (NSNumber) _parseFloatx:(NSString*)x{
			return __global__.__hxcpp_parse_float(x);
		}
		
		+  (NSNumber) randomx:(NSNumber*)x{
			return __global__.rand() % x;
		}
		
	}
}
