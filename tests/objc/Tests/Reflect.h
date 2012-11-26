

#import "Array.h"
#import "Reflect.h"

@interface Reflect : NSObject

-F-
+ (BOOL) hasField:(id)o field:(NSMutableString*)field;
-F-
+ (id) field:(id)o field:(NSMutableString*)field;
-F-
+ (void) setField:(id)o field:(NSMutableString*)field value:(id)value;
-F-
+ (id) getProperty:(id)o field:(NSMutableString*)field;
-F-
+ (void) setProperty:(id)o field:(NSMutableString*)field value:(id)value;
-F-
+ (id) callMethod:(id)o func:(id)func args:(NSMutabeArray*)args;
-F-
+ (NSMutabeArray*) fields:(id)o;
-F-
+ (BOOL) isFunction:(id)f;
-F-
+ (int) compare:(id)a b:(id)b;
-F-
+ (BOOL) compareMethods:(id)f1 f2:(id)f2;
-F-
+ (BOOL) isObject:(id)v;
-F-
+ (BOOL) deleteField:(id)o f:(NSMutableString*)f;
-F-
+ (id) copy:(id)o;
-F-
+ (id) makeVarArgs:(Function*)f;

@end
