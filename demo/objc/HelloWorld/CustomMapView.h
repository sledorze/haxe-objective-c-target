
#import <MapKit/MapKit.h>

#import "CustomMapView.h"

@interface CustomMapView : MKMapView 


- (void) locateLondon;
- (void) locate:(float)lat long:(float)long zoom:(float)zoom;

@end
