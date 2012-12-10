//
//  SKProductsRequest.h
//  StoreKit
//
//  Copyright 2009 Apple, Inc. All rights reserved.
//

#import <StoreKit/SKRequest.h>

@class SKProductsRequest, SKProductsResponse;


@protocol SKProductsRequestDelegate <SKRequestDelegate>

@required
// Sent immediately before -requestDidFinish:
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

}


// request information about products for your application
SK_EXTERN_CLASS_AVAILABLE(3_0)extern class SKProductsRequest : SKRequest {
@private
    id _productsRequestInternal;
}

// Set of string product identifiers
- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

	public var  id <SKProductsRequestDelegate> delegate __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

}


SK_EXTERN_CLASS_AVAILABLE(3_0)extern class SKProductsResponse extends NSObject {
@private
    id _internal;
}

// Array of SKProduct instances.
	public var (default, null) NSArray *products __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

// Array of invalid product identifiers.
	public var (default, null) NSArray *invalidProductIdentifiers __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

}
