//
//  UIDevice.h
package objc.ios.ui;
//
//  Copyright (c) 2007-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>

typedef NS_ENUM(NSInteger, UIDeviceOrientation) {
    UIDeviceOrientationUnknown,
    UIDeviceOrientationPortrait,            // Device oriented vertically, home button on the bottom
    UIDeviceOrientationPortraitUpsideDown,  // Device oriented vertically, home button on the top
    UIDeviceOrientationLandscapeLeft,       // Device oriented horizontally, home button on the right
    UIDeviceOrientationLandscapeRight,      // Device oriented horizontally, home button on the left
    UIDeviceOrientationFaceUp,              // Device oriented flat, face up
    UIDeviceOrientationFaceDown             // Device oriented flat, face down
};

typedef NS_ENUM(NSInteger, UIDeviceBatteryState) {
    UIDeviceBatteryStateUnknown,
    UIDeviceBatteryStateUnplugged,   // on battery, discharging
    UIDeviceBatteryStateCharging,    // plugged in, less than 100%
    UIDeviceBatteryStateFull,        // plugged in, at 100%
};              // available in iPhone 3.0

typedef NS_ENUM(NSInteger, UIUserInterfaceIdiom) {
#if __IPHONE_3_2 <= __IPHONE_OS_VERSION_MAX_ALLOWED
    UIUserInterfaceIdiomPhone,           // iPhone and iPod touch style UI
    UIUserInterfaceIdiomPad,             // iPad style UI
#endif
};

/* The UI_USER_INTERFACE_IDIOM() macro is provided for use when deploying to a version of the iOS less than 3.2. If the earliest version of iPhone/iOS that you will be deploying for is 3.2 or greater, you may use -[UIDevice userInterfaceIdiom] directly.
 */
#define UI_USER_INTERFACE_IDIOM() ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] ? [[UIDevice currentDevice] userInterfaceIdiom] : UIUserInterfaceIdiomPhone)

#define UIDeviceOrientationIsPortrait(orientation)  ((orientation) == UIDeviceOrientationPortrait || (orientation) == UIDeviceOrientationPortraitUpsideDown)
#define UIDeviceOrientationIsLandscape(orientation) ((orientation) == UIDeviceOrientationLandscapeLeft || (orientation) == UIDeviceOrientationLandscapeRight)

extern class UIDevice extends NSObject {
 @private
    NSInteger _numDeviceOrientationObservers;
    float     _batteryLevel;
    struct {
	unsigned int batteryMonitoringEnabled:1;
	unsigned int proximityMonitoringEnabled:1;
	unsigned int expectsFaceContactInLandscape:1;
        unsigned int orientation:3;
        unsigned int batteryState:2;
        unsigned int proximityState:1;
    } _deviceFlags;
}

+ (UIDevice *)currentDevice;

	public var (default, null) NSString    *name;              // e.g. "My iPhone"
	public var (default, null) NSString    *model;             // e.g. @"iPhone", @"iPod touch"
	public var (default, null) NSString    *localizedModel;    // localized version of model
	public var (default, null) NSString    *systemName;        // e.g. @"iOS"
	public var (default, null) NSString    *systemVersion;     // e.g. @"4.0"
	public var (default, null) UIDeviceOrientation orientation;       // return current device orientation.  this will return UIDeviceOrientationUnknown unless device orientation notifications are being generated.
	public var (default, null) NSString    *uniqueIdentifier  NS_DEPRECATED_IOS(2_0, 5_0);  // a string unique to each device based on various hardware info.

	public var (default, null) NSUUID      *identifierForVendor NS_AVAILABLE_IOS(6_0);      // a UUID that may be used to uniquely identify the device, same across apps from a single vendor.

	public var (nonatomic,readonly,getter=isGeneratingDeviceOrientationNotifications) BOOL generatesDeviceOrientationNotifications;
	public function beginGeneratingDeviceOrientationNotifications;      // nestable
	public function endGeneratingDeviceOrientationNotifications;

	public var (nonatomic,getter=isBatteryMonitoringEnabled) BOOL batteryMonitoringEnabled NS_AVAILABLE_IOS(3_0);  // default is NO
	public var (default, null) UIDeviceBatteryState          batteryState NS_AVAILABLE_IOS(3_0);  // UIDeviceBatteryStateUnknown if monitoring disabled
	public var (default, null) float                         batteryLevel NS_AVAILABLE_IOS(3_0);  // 0 .. 1.0. -1.0 if UIDeviceBatteryStateUnknown

	public var (nonatomic,getter=isProximityMonitoringEnabled) BOOL proximityMonitoringEnabled NS_AVAILABLE_IOS(3_0); // default is NO
	public var (default, null)                            BOOL proximityState NS_AVAILABLE_IOS(3_0);  // always returns NO if no proximity detector

	public var (nonatomic,readonly,getter=isMultitaskingSupported) BOOL multitaskingSupported NS_AVAILABLE_IOS(4_0);

	public var (default, null) UIUserInterfaceIdiom userInterfaceIdiom NS_AVAILABLE_IOS(3_2);

	public function playInputClick NS_AVAILABLE_IOS(4_2);  // Plays a click only if an enabling input view is on-screen and user has enabled input clicks.

}

extern interface UIInputViewAudioFeedback <NSObject>
@optional

	public var BOOL enableInputClicksWhenVisible; // If YES, an input view will enable playInputClick.

}

UIKIT_EXTERN NSString *const UIDeviceOrientationDidChangeNotification;
UIKIT_EXTERN NSString *const UIDeviceBatteryStateDidChangeNotification   NS_AVAILABLE_IOS(3_0);
UIKIT_EXTERN NSString *const UIDeviceBatteryLevelDidChangeNotification   NS_AVAILABLE_IOS(3_0);
UIKIT_EXTERN NSString *const UIDeviceProximityStateDidChangeNotification NS_AVAILABLE_IOS(3_0);
