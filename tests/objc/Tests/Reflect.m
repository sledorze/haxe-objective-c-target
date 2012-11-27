#import "Reflect.h"

@implementation Reflect

+ (BOOL) hasField:(id)o field:(NSMutableString*)field{
	return o != nil && [o __HasField "-dynamic_param-" ];
}
+ (id) field:(id)o field:(NSMutableString*)field{
	return ( (o == nil) ? nil : [o __Field "-dynamic_param-" ]);
}
+ (void) setField:(id)o field:(NSMutableString*)field value:(id)value{
	if (o != nil) [o __SetField "-dynamic_param-" ];
}
+ (id) getProperty:(id)o field:(NSMutableString*)field{
	return ( (o == nil) ? nil : [o __Field "-dynamic_param-" ]);
}
+ (void) setProperty:(id)o field:(NSMutableString*)field value:(id)value{
	if (o != nil) [o __SetField "-dynamic_param-" ];
}
+ (id) callMethod:(id)o func:(id)func args:(NSMutabeArray*)args{
	if (func != nil && [func __GetType] == __global__ GFA2 .vtString) func = [o __Field "-dynamic_param-" ];
	[func __SetThis "-dynamic_param-" ];
	return [func __Run "-dynamic_param-" ];
}
+ (NSMutabeArray*) fields:(id)o{
	if (o == nil) return [[NSMutabeArray alloc] new];
	
	NSMutabeArray *a = [[NSMutableArray alloc] initWithObjects:, nil]];
	[o __GetFields "-dynamic_param-" ];
	return a;
}
+ (BOOL) isFunction:(id)f{
	return f != nil && [f __GetType] == __global__ GFA2 .vtFunction;
}
+ (int) compare:(id)a b:(id)b{
	return ( (a == b) ? 0 : ( ((int)a > (int)b) ? 1 : -1));
}
+ (BOOL) compareMethods:(id)f1 f2:(id)f2{
	if (f1 == f2) return YES;
	if (![Reflect isFunction:f1] || ![Reflect isFunction:f2]) return NO;
	return [__global__ GFA2 .__hxcpp_same_closure "-dynamic_param-" ];
}
+ (BOOL) isObject:(id)v{
	if (v == nil) return NO;
	int t = [v __GetType];
	return t == __global__ GFA2 .vtObject || t == __global__ GFA2 .vtClass || t == __global__ GFA2 .vtString || t == __global__ GFA2 .vtArray;
}
+ (BOOL) deleteField:(id)o f:(NSMutableString*)f{
	if (o == nil) return NO;
	return [__global__ GFA2 .__hxcpp_anon_remove "-dynamic_param-" ];
}
+ (id) copy:(id)o{
	if (o == nil) return nil;
	if ([o __GetType] == __global__ GFA2 .vtString) return o;
	if ([o __GetType] == __global__ GFA2 .vtArray) return [[o __Field "-dynamic_param-" ]];
	id o2 = struct {
	} structName;
	{
		int _g = 0; 
		NSMutabeArray *_g1 = [Reflect fields:o];
		while (_g < _g1.length) {
			
			NSMutableString *f = [_g1 objectAtIndex:_g];
			++_g;
			if (o2 != nil) [o2 __SetField "-dynamic_param-" ];
		}
	}
	return o2;
}
+ (id) makeVarArgs:(Function*)f{
	return [__global__ GFA2 .__hxcpp_create_var_args "-dynamic_param-" ];
}

@end
