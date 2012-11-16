package objc.location;


#if ios

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>
#import <CoreLocation/CLAvailability.h>

@class CLRegion;
@class CLPlacemark;
@class CLGeocoderInternal;

// geocoding handler, CLPlacemarks are provided in order of most confident to least confident
//typedef void (^CLGeocodeCompletionHandler)(NSArray *placemarks, NSError *error);

extern class CLGeocoder extends NSObject {
	
	public var geocoding :Bool;

	public function reverseGeocodeLocation (location:CLLocation, completionHandler:CLGeocodeCompletionHandler) :Void;
	public function geocodeAddressDictionary (addressDictionary:NSDictionary, completionHandler:CLGeocodeCompletionHandler) :Void;
	public function geocodeAddressString (addressString:String, completionHandler:CLGeocodeCompletionHandler) :Void;
	public function geocodeAddressString (addressString:String, inRegion:CLRegion, completionHandler:CLGeocodeCompletionHandler) :Void;
	public function cancelGeocode () :Void;

}
#end
