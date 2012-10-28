
#import <MapKit/MapKit.h>

#import "objc/foundation/NSDictionary.h"
#import "objc/foundation/NSMutableArray.h"
#import "CustomMapView.h"

@interface CustomMapView : MKMapView 


- (void) locateLondon;
- (void) locate:(float)lat long:(float)long zoom:(float)zoom;

@end
