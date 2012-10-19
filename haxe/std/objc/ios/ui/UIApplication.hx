package objc.ios.ui;

/*

typedef NS_ENUM(NSInteger, UIStatusBarStyle) {
    UIStatusBarStyleDefault,
    UIStatusBarStyleBlackTranslucent,
    UIStatusBarStyleBlackOpaque
};

typedef NS_ENUM(NSInteger, UIStatusBarAnimation) {
    UIStatusBarAnimationNone,
#if __IPHONE_3_2 <= __IPHONE_OS_VERSION_MAX_ALLOWED
    UIStatusBarAnimationFade,
    UIStatusBarAnimationSlide,
#endif
};

// Note that UIInterfaceOrientationLandscapeLeft is equal to UIDeviceOrientationLandscapeRight (and vice versa).
// This is because rotating the device to the left requires rotating the content to the right.
typedef NS_ENUM(NSInteger, UIInterfaceOrientation) {
    UIInterfaceOrientationPortrait           = UIDeviceOrientationPortrait,
    UIInterfaceOrientationPortraitUpsideDown = UIDeviceOrientationPortraitUpsideDown,
    UIInterfaceOrientationLandscapeLeft      = UIDeviceOrientationLandscapeRight,
    UIInterfaceOrientationLandscapeRight     = UIDeviceOrientationLandscapeLeft
};


UIKIT_EXTERN NSString *const UIApplicationInvalidInterfaceOrientationException NS_AVAILABLE_IOS(6_0);

typedef NS_OPTIONS(NSUInteger, UIInterfaceOrientationMask) {
    UIInterfaceOrientationMaskPortrait = (1 << UIInterfaceOrientationPortrait),
    UIInterfaceOrientationMaskLandscapeLeft = (1 << UIInterfaceOrientationLandscapeLeft),
    UIInterfaceOrientationMaskLandscapeRight = (1 << UIInterfaceOrientationLandscapeRight),
    UIInterfaceOrientationMaskPortraitUpsideDown = (1 << UIInterfaceOrientationPortraitUpsideDown),
    UIInterfaceOrientationMaskLandscape = (UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight),
    UIInterfaceOrientationMaskAll = (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortraitUpsideDown),
    UIInterfaceOrientationMaskAllButUpsideDown = (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight),
};

#define UIDeviceOrientationIsValidInterfaceOrientation(orientation) ((orientation) == UIDeviceOrientationPortrait || (orientation) == UIDeviceOrientationPortraitUpsideDown || (orientation) == UIDeviceOrientationLandscapeLeft || (orientation) == UIDeviceOrientationLandscapeRight)
#define UIInterfaceOrientationIsPortrait(orientation)  ((orientation) == UIInterfaceOrientationPortrait || (orientation) == UIInterfaceOrientationPortraitUpsideDown)
#define UIInterfaceOrientationIsLandscape(orientation) ((orientation) == UIInterfaceOrientationLandscapeLeft || (orientation) == UIInterfaceOrientationLandscapeRight)

enum UIRemoteNotificationType {
    UIRemoteNotificationTypeNone    = 0,
    UIRemoteNotificationTypeBadge   = 1 << 0,
    UIRemoteNotificationTypeSound   = 1 << 1,
    UIRemoteNotificationTypeAlert   = 1 << 2,
    UIRemoteNotificationTypeNewsstandContentAvailability = 1 << 3,
}

enum UIApplicationState) {
    UIApplicationStateActive;
    UIApplicationStateInactive;
    UIApplicationStateBackground;
}

typedef NSUInteger UIBackgroundTaskIdentifier;
UIKIT_EXTERN const UIBackgroundTaskIdentifier UIBackgroundTaskInvalid  NS_AVAILABLE_IOS(4_0);
UIKIT_EXTERN const NSTimeInterval UIMinimumKeepAliveTimeout  NS_AVAILABLE_IOS(4_0);

typedef NS_ENUM(NSInteger, UIUserInterfaceLayoutDirection) {
    UIUserInterfaceLayoutDirectionLeftToRight,
    UIUserInterfaceLayoutDirectionRightToLeft,
} NS_ENUM_AVAILABLE_IOS(5_0);

@class UIView, UIWindow, UIStatusBar, UIStatusBarWindow, UILocalNotification;
@protocol UIApplicationDelegate;*/

extern class UIApplication extends UIResponder {
	
	public static function sharedApplication () :UIApplication;
	
	public var delegate :UIApplicationDelegate;
	public var idleTimerDisabled :Bool;
	public var keyWindow :UIWindow;
	public var windows :Array<UIWindow>;
}

/*  

- (void)beginIgnoringInteractionEvents;               // nested. set should be set during animations & transitions to ignore touch and other events
- (void)endIgnoringInteractionEvents;
- (BOOL)isIgnoringInteractionEvents;                  // returns YES if we are at least one deep in ignoring events
- (BOOL)openURL:(NSURL*)url;
- (BOOL)canOpenURL:(NSURL *)url NS_AVAILABLE_IOS(3_0);

- (void)sendEvent:(UIEvent *)event;

- (BOOL)sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event;

@property(nonatomic,getter=isNetworkActivityIndicatorVisible) BOOL networkActivityIndicatorVisible; // showing network spinning gear in status bar. default is NO

@property(nonatomic) UIStatusBarStyle statusBarStyle; // default is UIStatusBarStyleDefault
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle animated:(BOOL)animated;

@property(nonatomic,getter=isStatusBarHidden) BOOL statusBarHidden;
- (void)setStatusBarHidden:(BOOL)hidden withAnimation:(UIStatusBarAnimation)animation NS_AVAILABLE_IOS(3_2);

// Rotate to a specific orientation.  This only rotates the status bar and updates the statusBarOrientation property.
// This does not change automatically if the device changes orientation.
// Explicit setting of the status bar orientation is more limited in iOS 6.0 and later.
@property(nonatomic) UIInterfaceOrientation statusBarOrientation;
- (void)setStatusBarOrientation:(UIInterfaceOrientation)interfaceOrientation animated:(BOOL)animated;

// The system only calls this method if the application delegate has not
// implemented the delegate equivalent. It returns the orientations specified by
// the application's info.plist. If no supported interface orientations were
// specified it will return UIInterfaceOrientationMaskAll on an iPad and
// UIInterfaceOrientationMaskAllButUpsideDown on a phone.  The return value
// should be one of the UIInterfaceOrientationMask values which indicates the
// orientations supported by this application.
- (NSUInteger)supportedInterfaceOrientationsForWindow:(UIWindow *)window NS_AVAILABLE_IOS(6_0);

@property(nonatomic,readonly) NSTimeInterval statusBarOrientationAnimationDuration; // Returns the animation duration for the status bar during a 90 degree orientation change.  It should be doubled for a 180 degree orientation change.
@property(nonatomic,readonly) CGRect statusBarFrame; // returns CGRectZero if the status bar is hidden

@property(nonatomic) NSInteger applicationIconBadgeNumber;  // set to 0 to hide. default is 0

@property(nonatomic) BOOL applicationSupportsShakeToEdit NS_AVAILABLE_IOS(3_0);

@property(nonatomic,readonly) UIApplicationState applicationState NS_AVAILABLE_IOS(4_0);
@property(nonatomic,readonly) NSTimeInterval backgroundTimeRemaining NS_AVAILABLE_IOS(4_0);

- (UIBackgroundTaskIdentifier)beginBackgroundTaskWithExpirationHandler:(void(^)(void))handler  NS_AVAILABLE_IOS(4_0);
- (void)endBackgroundTask:(UIBackgroundTaskIdentifier)identifier NS_AVAILABLE_IOS(4_0);

- (BOOL)setKeepAliveTimeout:(NSTimeInterval)timeout handler:(void(^)(void))keepAliveHandler NS_AVAILABLE_IOS(4_0);
- (void)clearKeepAliveTimeout NS_AVAILABLE_IOS(4_0);

@property(nonatomic,readonly,getter=isProtectedDataAvailable) BOOL protectedDataAvailable NS_AVAILABLE_IOS(4_0);

@property(nonatomic,readonly) UIUserInterfaceLayoutDirection userInterfaceLayoutDirection NS_AVAILABLE_IOS(5_0);

@end

@interface UIApplication (UIRemoteNotifications)

- (void)registerForRemoteNotificationTypes:(UIRemoteNotificationType)types NS_AVAILABLE_IOS(3_0);
- (void)unregisterForRemoteNotifications NS_AVAILABLE_IOS(3_0);       // calls -registerForRemoteNotificationTypes with UIRemoteNotificationTypeNone

// returns the enabled types, also taking into account any systemwide settings; doesn't relate to connectivity
- (UIRemoteNotificationType)enabledRemoteNotificationTypes NS_AVAILABLE_IOS(3_0);

@end

@interface UIApplication (UILocalNotifications)

- (void)presentLocalNotificationNow:(UILocalNotification *)notification NS_AVAILABLE_IOS(4_0);

- (void)scheduleLocalNotification:(UILocalNotification *)notification NS_AVAILABLE_IOS(4_0);  // copies notification
- (void)cancelLocalNotification:(UILocalNotification *)notification NS_AVAILABLE_IOS(4_0);
- (void)cancelAllLocalNotifications NS_AVAILABLE_IOS(4_0);
@property(nonatomic,copy) NSArray *scheduledLocalNotifications NS_AVAILABLE_IOS(4_0);         // setter added in iOS 4.2

@end

@interface UIApplication (UIRemoteControlEvents)

- (void)beginReceivingRemoteControlEvents NS_AVAILABLE_IOS(4_0);
- (void)endReceivingRemoteControlEvents NS_AVAILABLE_IOS(4_0);

@end

@interface UIApplication (UINewsstand)
- (void)setNewsstandIconImage:(UIImage *)image;
@end

@interface UIApplication (UIStateRestoration)
// These methods are used to inform the system that state restoration is occuring asynchronously after the application
// has processed its restoration archive on launch. In the even of a crash, the system will be able to detect that it may
// have been caused by a bad restoration archive and arrange to ignore it on a subsequent application launch.
- (void)extendStateRestoration  NS_AVAILABLE_IOS(6_0);
- (void)completeStateRestoration  NS_AVAILABLE_IOS(6_0);
@end
*/