#import "Hash.h"

@implementation Hash

-F-
- (void) set:(NSMutableString*)key value:(id)value "-E-Block>" {
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .setObject "-dynamic_param-" ];
}
-F-
- (id) get:(NSMutableString*)key "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .objectForKey "-dynamic_param-" ];
}
-F-
- (BOOL) exists:(NSMutableString*)key "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .objectForKey "-dynamic_param-" ] != "-gen_val_op-" "-V-Const>"  "-E-Const>" nil;
}
-F-
- (BOOL) remove:(NSMutableString*)key "-E-Block>" {
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
	 "-E-Vars>" 
	NSMutabeArray *it =  "-V-ArrayDecl>"  "-E-ArrayDecl>" [[NSMutableArray alloc] initWithObjects: "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" a "-FA-"  iterator], nil]];
	 "-E-Vars>" 
	NSMutabeArray *me =  "-V-ArrayDecl>"  "-E-ArrayDecl>" [[NSMutableArray alloc] initWithObjects: "-V-Const>"  "-E-Const>" self, nil]];
	 "-E-Return>" return  "-V-ObjectDecl>"  "-E-ObjectDecl>" {hasNext: "-V-Function>"  "-E-Function>" (BOOL) "-E-Block>" {
		 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" it objectAtIndex: "-V-Const>"  "-E-Const>" 0] "-FA-"  GFA2 .hasNext];
	} ,next: "-V-Function>"  "-E-Function>" (id) "-E-Block>" {
		 "-E-Return>" return  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Field>"  "-E-Field>"  "-V-Array>"  "-E-Array>" [ "-V-Local>"  "-E-Local>" me objectAtIndex: "-V-Const>"  "-E-Const>" 0] "-FA-" .__Internal "-FA-"  GFA2 .__Field "-dynamic_param-" ];
	}};
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
