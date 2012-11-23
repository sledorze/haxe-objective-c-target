#import "Lib.h"

@implementation Lib

+ (void) log:(id)v{
}
+ (BOOL) getURL:(NSMutableString*)url target:(NSMutableString*)target{
	return AppDelegate applicationHandleOpenURL:UIApplication handleOpenURL:NSURL];
}
+ (UIImageView*) attach:(NSMutableString*)name{
	return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"name"]];
}
+ (NSMutabeArray*) enumerateLibraryGroups{
	return nil;
}
+ (NSMutabeArray*) fetchCameraItemsInGroup:(NSMutableString*)group{
	return nil;
}
+ (CLLocation*) location{
	return nil;
}
+ (BOOL) isIpad{
	
	NSMutableString *deviceType = [UIDevice currentDevice].model;
	return deviceType == @"iPad";
	return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}
+ (BOOL) isIpod{
	
	NSMutableString *deviceType = [UIDevice currentDevice].model;
	return deviceType == @"iPod touch";
	return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}
+ (UIAlertView*) alert:(NSMutableString*)title message:(NSMutableString*)message{
	
	UIAlertView *a = [[[UIAlertView alloc] new][].initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
	[a show];
	return a;
}

@end
