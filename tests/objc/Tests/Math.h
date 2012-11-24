


@interface Math : NSObject

-F-
+ (float) PI:(float)val;
-F-
+ (float) NaN:(float)val;
-F-
+ (float) NEGATIVE_INFINITY:(float)val;
-F-
+ (float) POSITIVE_INFINITY:(float)val;
-F-
+ (float) abs:(float)v;
-F-
+ (float) min:(float)a b:(float)b;
-F-
+ (float) max:(float)a b:(float)b;
-F-
+ (float) sin:(float)v;
-F-
+ (float) cos:(float)v;
-F-
+ (float) atan2:(float)y x:(float)x;
-F-
+ (float) tan:(float)v;
-F-
+ (float) exp:(float)v;
-F-
+ (float) log:(float)v;
-F-
+ (float) sqrt:(float)v;
-F-
+ (int) round:(float)v;
-F-
+ (int) floor:(float)v;
-F-
+ (int) ceil:(float)v;
-F-
+ (float) atan:(float)v;
-F-
+ (float) asin:(float)v;
-F-
+ (float) acos:(float)v;
-F-
+ (float) pow:(float)v exp:(float)exp;
-F-
+ (float) random;
-F-
+ (BOOL) isFinite:(float)f;
-F-
+ (BOOL) isNaN:(float)f;

@end
