// File generated with the new haXe objc target.
//

@implementation Std
		+ (BOOL) _isv:(**)v t:(**)t{
			return __global__.__instanceof :v, t];
		}
		
		+ (NSString) strings:(**)s{
			return ((s == nil)?@"null":s.toString :]);
		}
		
		+ (NSNumber) _intx:(NSNumber*)x{
			return __global__.__int__ :x];
		}
		
		+ (*) _parseIntx:(NSString*)x{
			return __global__.__hxcpp_parse_int :x];
		}
		
		+ (NSNumber) _parseFloatx:(NSString*)x{
			return __global__.__hxcpp_parse_float :x];
		}
		
		+ (NSNumber) randomx:(NSNumber*)x{
			return __global__.rand :] % x;
		}
		
	@end

