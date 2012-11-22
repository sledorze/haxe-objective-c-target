//
//  ADBannerView_Deprecated.h
//  iAd
//
//  Copyright 2012 Apple, Inc. All rights reserved.
//

#import <iAd/ADBannerView.h>

extern class ADBannerView (Deprecated)

	public var NSSet *requiredContentSizeIdentifiers __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_NA,__MAC_NA,__IPHONE_4_0,__IPHONE_6_0);

	public var NSString *currentContentSizeIdentifier __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_NA,__MAC_NA,__IPHONE_4_0,__IPHONE_6_0);

+ (CGSize)sizeFromBannerContentSizeIdentifier:(NSString *)contentSizeIdentifier __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_NA,__MAC_NA,__IPHONE_4_0,__IPHONE_6_0);

}

extern NSString * const ADBannerContentSizeIdentifier320x50 __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_NA,__MAC_NA,__IPHONE_4_0,__IPHONE_4_2);
extern NSString * const ADBannerContentSizeIdentifier480x32 __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_NA,__MAC_NA,__IPHONE_4_0,__IPHONE_4_2);
extern NSString * const ADBannerContentSizeIdentifierPortrait __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_NA,__MAC_NA,__IPHONE_4_2,__IPHONE_6_0);
extern NSString * const ADBannerContentSizeIdentifierLandscape __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_NA,__MAC_NA,__IPHONE_4_2,__IPHONE_6_0);
