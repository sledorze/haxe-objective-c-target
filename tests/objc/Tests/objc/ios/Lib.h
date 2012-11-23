
#import <UIKit/UIKit.h>

#import "Array.h"
#import "CLLocation.h"

@interface Lib : NSObject

+ (void) log:(id)v;
+ (BOOL) getURL:(NSMutableString*)url target:(NSMutableString*)target;
+ (UIImageView*) attach:(NSMutableString*)name;
+ (NSMutabeArray*) enumerateLibraryGroups;
+ (NSMutabeArray*) fetchCameraItemsInGroup:(NSMutableString*)group;
+ (CLLocation*) location;
+ (BOOL) isIpad;
+ (BOOL) isIpod;
+ (UIAlertView*) alert:(NSMutableString*)title message:(NSMutableString*)message;

@end
