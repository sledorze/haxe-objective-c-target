
#import <UIKit/UIKit.h>

#import "Lib.h"
#import "Array.h"
#import "CLLocation.h"

@interface Lib : NSObject

-F-
+ (void) log:(id)v;
-F-
+ (void) print:(id)v;
-F-
+ (void) println:(id)v;
-F-
+ (BOOL) getURL:(NSMutableString*)url target:(NSMutableString*)target;
-F-
+ (UIImageView*) attach:(NSMutableString*)name;
-F-
+ (NSMutabeArray*) enumerateLibraryGroups;
-F-
+ (NSMutabeArray*) fetchCameraItemsInGroup:(NSMutableString*)group;
-F-
+ (CLLocation*) location;
-F-
+ (BOOL) isIpad;
-F-
+ (BOOL) isIpod;
-F-
+ (UIAlertView*) alert:(NSMutableString*)title message:(NSMutableString*)message;

@end
