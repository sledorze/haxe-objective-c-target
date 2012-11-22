/*
 *  CLPlacemark.h
 *  CoreLocation
 *
 *  Copyright (c) 2010 Apple Inc. All rights reserved.
 */

#if TARGET_OS_IPHONE

#import <Foundation/Foundation.h>
#import <CoreLocation/CLAvailability.h>

@class CLLocation;
@class CLRegion;
@class CLPlacemarkInternal;

/*
 *  CLPlacemark
 *  
 *  Discussion:
 *    Represents placemark data for a geographic location. Placemark data can be
 *    information such as the country, state, city, and street address.
 */

NS_CLASS_AVAILABLE(TBD,5_0)
extern class CLPlacemark extends NSObject <NSCopying, NSCoding>
{
@private
    CLPlacemarkInternal *_internal;
}

/*
 * initWithPlacemark:
 *
 * Discussion:
 *   Initialize a newly allocated placemark from another placemark, copying its data.
 */
- (id)initWithPlacemark:(CLPlacemark *)placemark;

/*
 *  location
 *  
 *  Discussion:
 *    Returns the geographic location associated with the placemark.
 */
	public var CLLocation *location;

/*
 *  region
 *  
 *  Discussion:
 *    Returns the geographic region associated with the placemark.
 */
	public var CLRegion *region;

/*
 *  addressDictionary
 *  
 *  Discussion:
 *    This dictionary can be formatted as an address using ABCreateStringWithAddressDictionary,
 *    defined in the AddressBookUI framework.
 */
	public var NSDictionary *addressDictionary;

// address dictionary properties
	public var NSString *name; // eg. Apple Inc.
	public var NSString *thoroughfare; // street address, eg. 1 Infinite Loop
	public var NSString *subThoroughfare; // eg. 1
	public var NSString *locality; // city, eg. Cupertino
	public var NSString *subLocality; // neighborhood, common name, eg. Mission District
	public var NSString *administrativeArea; // state, eg. CA
	public var NSString *subAdministrativeArea; // county, eg. Santa Clara
	public var NSString *postalCode; // zip code, eg. 95014
	public var NSString *ISOcountryCode; // eg. US
	public var NSString *country; // eg. United States
	public var NSString *inlandWater; // eg. Lake Tahoe
	public var NSString *ocean; // eg. Pacific Ocean
	public var NSArray *areasOfInterest; // eg. Golden Gate Park
}

#endif //TARGET_OS_IPHONE
