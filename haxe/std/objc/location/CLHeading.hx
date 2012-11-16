package objc.location;

typedef CLHeadingComponentValue = Float;


extern const CLLocationDegrees kCLHeadingFilterNone;

extern class CLHeading extends NSObject /*<NSCopying, NSCoding>*/{

	public var magneticHeading :CLLocationDirection;
	public var trueHeading :CLLocationDirection;
	public var headingAccuracy :CLLocationDirection;
	public var x :CLHeadingComponentValue x;
	public var y :CLHeadingComponentValue y;
	public var z :CLHeadingComponentValue z;
	public var timestamp :NSDate;
	public var description :String;

}
