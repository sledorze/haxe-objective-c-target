#import "Math.h"

@implementation Math

-F-
+ (float) PI:(float)val {
	static float _val;
	if (val == nil) { if (_val == nil) _val = ; }
	else { if (_val != nil) _val = val; }
	return _val;
}
-F-
+ (float) NaN:(float)val {
	static float _val;
	if (val == nil) { if (_val == nil) _val = ; }
	else { if (_val != nil) _val = val; }
	return _val;
}
-F-
+ (float) NEGATIVE_INFINITY:(float)val {
	static float _val;
	if (val == nil) { if (_val == nil) _val = ; }
	else { if (_val != nil) _val = val; }
	return _val;
}
-F-
+ (float) POSITIVE_INFINITY:(float)val {
	static float _val;
	if (val == nil) { if (_val == nil) _val = ; }
	else { if (_val != nil) _val = val; }
	return _val;
}
-F-
+ (float) abs:(float)v -E-Block> {
	 -E-Return> return -V-Call> -E-Call> absf(v);
}
-F-
+ (float) min:(float)a b:(float)b -E-Block> {
	 -E-Return> return -V-If>(-V-Parenthesis> -E-Parenthesis>  (-V-Binop> -E-Binop> -gen_val_op--V-Local> -E-Local> a < -gen_val_op--V-Local> -E-Local> b) ? -V-Local> -E-Local> a : -V-Local> -E-Local> b);
}
-F-
+ (float) max:(float)a b:(float)b -E-Block> {
	 -E-Return> return -V-If>(-V-Parenthesis> -E-Parenthesis>  (-V-Binop> -E-Binop> -gen_val_op--V-Local> -E-Local> a > -gen_val_op--V-Local> -E-Local> b) ? -V-Local> -E-Local> a : -V-Local> -E-Local> b);
}
-F-
+ (float) sin:(float)v -E-Block> {
	 -E-Return> return -V-Call> -E-Call> sinf(v);
}
-F-
+ (float) cos:(float)v -E-Block> {
	 -E-Return> return -V-Call> -E-Call> cosf(v);
}
-F-
+ (float) atan2:(float)y x:(float)x -E-Block> {
	 -E-Return> return -V-Call> -E-Call> atan2(v);
}
-F-
+ (float) tan:(float)v -E-Block> {
	 -E-Return> return -V-Call> -E-Call> tanf(v);
}
-F-
+ (float) exp:(float)v -E-Block> {
	 -E-Return> return -V-Call> -E-Call> expf(v);
}
-F-
+ (float) log:(float)v -E-Block> {
	 -E-Return> return -V-Call> -E-Call> [-V-Local> -E-Local> logf-non-];
}
-F-
+ (float) sqrt:(float)v -E-Block> {
	 -E-Return> return -V-Call> -E-Call> sqrtf(v);
}
-F-
+ (int) round:(float)v -E-Block> {
	 -E-Return> return -V-Call> -E-Call> roundf(v);
}
-F-
+ (int) floor:(float)v -E-Block> {
	 -E-Return> return -V-Call> -E-Call> floorf(v);
}
-F-
+ (int) ceil:(float)v -E-Block> {
	 -E-Return> return -V-Call> -E-Call> ceilf(v);
}
-F-
+ (float) atan:(float)v -E-Block> {
	 -E-Return> return -V-Call> -E-Call> atanf(v);
}
-F-
+ (float) asin:(float)v -E-Block> {
	 -E-Return> return -V-Call> -E-Call> asinf(v);
}
-F-
+ (float) acos:(float)v -E-Block> {
	 -E-Return> return -V-Call> -E-Call> acosf(v);
}
-F-
+ (float) pow:(float)v exp:(float)exp -E-Block> {
	 -E-Return> return -V-Call> -E-Call> powf(v, exp);
}
-F-
+ (float) random -E-Block> {
	 -E-Return> return -V-Call> -E-Call> rand();
}
-F-
+ (BOOL) isFinite:(float)f -E-Block> {
	 -E-Return> return -V-Call> -E-Call> !double.IsInfinity(f);
}
-F-
+ (BOOL) isNaN:(float)f -E-Block> {
	 -E-Return> return -V-Call> -E-Call> double.IsNaN(f);
}

@end
