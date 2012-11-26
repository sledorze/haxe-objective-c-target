#import "StringBuf.h"

@implementation StringBuf

-F-
@synthesize b;
-F-
- (void) add:(id)x "-E-Block>" {
	 "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .b appendString:"-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Std "-FA-"  string: "-V-Local>"  "-E-Local>" x]];
}
-F-
- (void) addChar:(int)c "-E-Block>" {
	 "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .b appendString:"-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" NSMutableString "-FA-" fromCharCode: "-V-Local>"  "-E-Local>" c]];
}
-F-
- (void) addSub:(NSMutableString*)s pos:(int)pos len:(id)len "-E-Block>" {
	 "-E-Binop>" ["-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .b appendString:"-gen_val_op-" "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" s "-FA-"  substringWithRange: "-V-Local>"  "-E-Local>" pos len: "-V-Local>"  "-E-Local>" len]];
}
-F-
- (NSMutableString*) toString "-E-Block>" {
	 "-E-Return>" return  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .b;
}
-F-
- (id) new "-E-Block>" {
	self = [super init];
	 "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .b = "-gen_val_op-" "-V-Const>"  "-E-Const>" @"";
	return self;
}

@end
