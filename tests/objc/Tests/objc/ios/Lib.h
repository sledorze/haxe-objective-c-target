
#import <UIKit/UIKit.h>

#import "Lib.h"
#import "Array.h"
#import "CLLocation.h"

@interface Lib : NSObject

+ (void) log:(id)v;
+ (void) print:(id)v;
+ (void) println:(id)v;
+ (BOOL) getURL:(NSMutableString*)url target:(NSMutableString*)target;
+ (UIImageView*) attach:(NSMutableString*)name;
+ (NSMutabeArray*) enumerateLibraryGroups;
+ (NSMutabeArray*) fetchCameraItemsInGroup:(NSMutableString*)group;
+ (CLLocation*) location;
+ (BOOL) isIpad;
+ (BOOL) isIpod;
+ (UIAlertView*) alert:(NSMutableString*)title message:(NSMutableString*)message;

@end
