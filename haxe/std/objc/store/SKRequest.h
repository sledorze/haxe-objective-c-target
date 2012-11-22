//
//  SKRequest.h
//  StoreKit
//
//  Copyright 2009 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKitDefines.h>

@protocol SKRequestDelegate;

// Base class used to fetch data from the store.  Should not be used directly.
SK_EXTERN_CLASS_AVAILABLE(3_0)extern class SKRequest extends NSObject {
@private
    id _requestInternal;
}

	public var  id <SKRequestDelegate> delegate __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

// Cancel the request if it has started.
- (void)cancel __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

// Start the request if it has not already been started.
- (void)start __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

}


@protocol SKRequestDelegate <NSObject>

@optional
- (void)requestDidFinish:(SKRequest *)request __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

}
