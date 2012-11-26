#import "IntHash.h"

@implementation IntHash

-F-
- (void) set:(int)key value:(id)value "-E-Block>" {
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .setObject "-dynamic_param-" ];
}
-F-
- (id) get:(int)key "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .objectForKey "-dynamic_param-" ];
}
-F-
- (BOOL) exists:(int)key "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .objectForKey "-dynamic_param-" ] != "-gen_val_op-" "-V-Const>"  "-E-Const>" nil;
}
-F-
- (BOOL) remove:(int)key "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .removeObjectForKey "-dynamic_param-" ];
}
-F-
- (id) keys "-E-Block>" {
	 "-E-Vars>" 
	NSMutabeArray *a =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .allKeys];
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" a "-FA-"  iterator];
}
-F-
- (id) iterator "-E-Block>" {
	 "-E-Vars>" 
	NSMutabeArray *a =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .allValues];
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" a "-FA-"  iterator];
}
-F-
- (NSMutableString*) toString "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .description];
}
-F-
- (id) new "-E-Block>" {
	self = [super init];
	return self;
}

@end
