#import "IntIter.h"

@implementation IntIter

-F-
@synthesize min;
-F-
@synthesize max;
-F-
- (BOOL) hasNext "-E-Block>" {
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .min < "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .max;
}
-F-
- (int) next "-E-Block>" {
	 "-E-Return>" return  "-V-Unop>"  "-E-Unop>"  "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .min++;
}
-F-
- (id) new:(int)min max:(int)max "-E-Block>" {
	self = [super init];
	 "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .min = "-gen_val_op-" "-V-Local>"  "-E-Local>" min;
	 "-E-Binop>" "-gen_val_op-" "-V-Field>"  "-E-Field>"  "-V-Const>"  "-E-Const>" self "-FA-" .max = "-gen_val_op-" "-V-Local>"  "-E-Local>" max;
	return self;
}

@end
