package;
//import objc.foundation.NSValue;// NSNumber
//#include <math.h>
//#include <stdio.h>

// This is mostly using C api to do math operations

@:core_api @:nativegen class Math
{
	public static inline function __init__():Void
	{
		//PI = M_PI;
		NaN = untyped __objc__("NaN");
		NEGATIVE_INFINITY = untyped __objc__("-INFINITY or DBL_MAX");
		POSITIVE_INFINITY = untyped __objc__("DBL_MAX");
		//rand = new Random();
		
	}
	
	//private static var rand:Random;
	public static var PI(default, null) : Float;
	public static var NaN(default,null) : Float;
	public static var NEGATIVE_INFINITY(default,null) : Float;
	public static var POSITIVE_INFINITY(default,null) : Float;

	public static inline function abs(v:Float):Float
	{
		return untyped __objc__("absf(v)");
	}
	
	public static inline function min(a:Float, b:Float):Float
	{
		return untyped fminf (a, b);
	}
	
	public static inline function max(a:Float, b:Float):Float
	{
		return untyped fmaxf (a, b);
	}
	
	public static inline function sin(v:Float):Float
	{
		return untyped __objc__("sinf(v)");
	}
	
	public static inline function cos(v:Float):Float
	{
		return untyped __objc__("cosf(v)");
	}
	
	public static inline function atan2(y:Float, x:Float):Float
	{
		return untyped __objc__("atan2(v)");
	}
	
	public static inline function tan(v:Float):Float
	{
		return untyped __objc__("tanf(v)");
	}
	
	public static inline function exp(v:Float):Float
	{
		return untyped __objc__("expf(v)");
	}
	
	public static inline function log(v:Float):Float
	{
		return untyped logf(v);
	}
	
	public static inline function sqrt(v:Float):Float
	{
		return untyped __objc__("sqrtf(v)");
	}
	
	public static function round(v:Float):Int
	{
		return untyped __objc__("roundf(v)");
	}
	
	public static inline function floor(v:Float):Int
	{
		return untyped __objc__("floorf(v)");
	}
	
	public static inline function ceil(v:Float):Int
	{
		return untyped __objc__("ceilf(v)");
	}
	
	public static inline function atan(v:Float):Float
	{
		return untyped __objc__("atanf(v)");
	}
	
	public static inline function asin(v:Float):Float
	{
		return untyped __objc__("asinf(v)");
	}
	
	public static inline function acos(v:Float):Float
	{
		return untyped __objc__("acosf(v)");
	}
	
	public static inline function pow(v:Float, exp:Float):Float
	{
		return untyped __objc__("powf(v, exp)");
	}
	
	public static inline function random() : Float
	{
		return untyped __objc__("rand()");
	}

	public static function isFinite( f : Float ) : Bool
	{
		return untyped __objc__("!double.IsInfinity(f)");
	}
	
	public static function isNaN( f : Float ) : Bool
	{
		return untyped __objc__("double.IsNaN(f)");
	}
}