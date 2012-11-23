package objc.location;
import objc.foundation.NSObject;
import objc.foundation.NSDate;

typedef CLLocationDegrees = Float;
typedef CLLocationAccuracy = Float;
typedef CLLocationSpeed = Float;
typedef CLLocationDirection = Float;


extern class CLLocationCoordinate2D {
	function new (latitude:CLLocationDegrees, longitude:CLLocationDegrees) :Void;
}
// Convert this class in the compiler to:
//CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)

typedef CLLocationDistance = Float;
/*extern const CLLocationDistance kCLDistanceFilterNone;
extern const CLLocationAccuracy kCLLocationAccuracyBestForNavigation __OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_4_0);
extern const CLLocationAccuracy kCLLocationAccuracyBest;
extern const CLLocationAccuracy kCLLocationAccuracyNearestTenMeters;
extern const CLLocationAccuracy kCLLocationAccuracyHundredMeters;
extern const CLLocationAccuracy kCLLocationAccuracyKilometer;
extern const CLLocationAccuracy kCLLocationAccuracyThreeKilometers;
extern const CLLocationDistance CLLocationDistanceMax;
extern const NSTimeInterval CLTimeIntervalMax;
extern const CLLocationCoordinate2D kCLLocationCoordinate2DInvalid __OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_4_0);
BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord) __OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_4_0);
*/


/*
 *  CLLocation
 *  
 *  Discussion:
 *    Represents a geographical coordinate along with accuracy and timestamp information.
 */
extern class CLLocation extends NSObject /*<NSCopying, NSCoding>*/ {

	public function initWithLatitude (latitude:CLLocationDegrees, longitude:CLLocationDegrees) :CLLocation;
	public function initWithCoordinate (coordinate:CLLocationCoordinate2D, altitude:CLLocationDistance, horizontalAccuracy:CLLocationAccuracy, verticalAccuracy:CLLocationAccuracy, timestamp:NSDate) :CLLocation;
	//public function initWithCoordinate (coordinate:CLLocationCoordinate2D, altitude:CLLocationDistance, horizontalAccuracy:CLLocationAccuracy, verticalAccuracy:CLLocationAccuracy, course:CLLocationDirection, speed:CLLocationSpeed, timestamp:NSDate) :CLLocation;

	public var coordinate :CLLocationCoordinate2D;
	public var altitude :CLLocationDistance;
	public var horizontalAccuracy :CLLocationAccuracy;
	public var verticalAccuracy :CLLocationAccuracy;
	public var course :CLLocationDirection;
	public var speed :CLLocationSpeed;
	public var timestamp :NSDate;

	public function description () :String;
	public function getDistanceFrom (location:CLLocation) :CLLocationDistance;
	public function distanceFromLocation (location:CLLocation) :CLLocationDistance;

}
