#import "Lib.h"

@implementation Lib

-F-
+ (void) log:(id)v "-E-Block>" {
}
-F-
+ (void) print:(id)v "-E-Block>" {
	 "-E-Call>" printf ( [[v description] cStringUsingEncoding:NSStringEncodingConversionAllowLossy] );
}
-F-
+ (void) println:(id)v "-E-Block>" {
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" Lib "-FA-"  print: "-V-Local>"  "-E-Local>" v];
	 "-E-Call>" printf ( "\n" );
}
-F-
+ (BOOL) getURL:(NSMutableString*)url target:(NSMutableString*)target "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" AppDelegate applicationHandleOpenURL:UIApplication handleOpenURL:NSURL];
}
-F-
+ (UIImageView*) attach:(NSMutableString*)name "-E-Block>" {
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"name"]];
}
-F-
+ (NSMutabeArray*) enumerateLibraryGroups "-E-Block>" {
	 "-E-Return>" return  "-V-Const>"  "-E-Const>" nil;
}
-F-
+ (NSMutabeArray*) fetchCameraItemsInGroup:(NSMutableString*)group "-E-Block>" {
	 "-E-Return>" return  "-V-Const>"  "-E-Const>" nil;
}
-F-
+ (CLLocation*) location "-E-Block>" {
	 "-E-Return>" return  "-V-Const>"  "-E-Const>" nil;
}
-F-
+ (BOOL) isIpad "-E-Block>" {
	 "-E-Vars>" 
	NSMutableString *deviceType =  "-V-Field>"  "-E-Field>"  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" UIDevice "-FA-"  currentDevice] "-FA-" .model;
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" deviceType == "-gen_val_op-" "-V-Const>"  "-E-Const>" @"iPad";
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}
-F-
+ (BOOL) isIpod "-E-Block>" {
	 "-E-Vars>" 
	NSMutableString *deviceType =  "-V-Field>"  "-E-Field>"  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-TypeExpr>"  "-E-TypeExpr>" UIDevice "-FA-"  currentDevice] "-FA-" .model;
	 "-E-Return>" return  "-V-Binop>"  "-E-Binop>" "-gen_val_op-" "-V-Local>"  "-E-Local>" deviceType == "-gen_val_op-" "-V-Const>"  "-E-Const>" @"iPod touch";
	 "-E-Return>" return  "-V-Call>"  "-E-Call>" UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}
-F-
+ (UIAlertView*) alert:(NSMutableString*)title message:(NSMutableString*)message "-E-Block>" {
	 "-E-Vars>" 
	UIAlertView *a =  "-V-Call>"  "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-New>"  "-E-New>" [[UIAlertView alloc] new] "-FA-"  initWithTitle: "-V-Local>"  "-E-Local>" title message: "-V-Local>"  "-E-Local>" message delegate: "-V-Const>"  "-E-Const>" nil cancelButtonTitle: "-V-Const>"  "-E-Const>" @"Cancel" otherButtonTitles: "-V-Const>"  "-E-Const>" nil];
	 "-E-Call>" [ "-CALL-Field>"  "-V-Field>"  "-E-Field>"  "-V-Local>"  "-E-Local>" a "-FA-"  show];
	 "-E-Return>" return  "-V-Local>"  "-E-Local>" a;
}

@end
