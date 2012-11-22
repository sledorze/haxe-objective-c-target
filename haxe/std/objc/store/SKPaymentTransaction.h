//
//  SKPaymentTransaction.h
//  StoreKit
//
//  Copyright 2009 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKitDefines.h>

@class SKPayment;

enum {
    SKPaymentTransactionStatePurchasing,    // Transaction is being added to the server queue.
    SKPaymentTransactionStatePurchased,     // Transaction is in queue, user has been charged.  Client should complete the transaction.
    SKPaymentTransactionStateFailed,        // Transaction was cancelled or failed before being added to the server queue.
    SKPaymentTransactionStateRestored       // Transaction was restored from user's purchase history.  Client should complete the transaction.
};
typedef NSInteger SKPaymentTransactionState;

SK_EXTERN_CLASS_AVAILABLE(3_0)extern class SKPaymentTransaction extends NSObject {
@private
    id _internal;
}

// Only set if state is SKPaymentTransactionFailed
	public var (default, null) NSError *error __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

// Only valid if state is SKPaymentTransactionStateRestored.
	public var (default, null) SKPaymentTransaction *originalTransaction __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

	public var (default, null) SKPayment *payment __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

// Available downloads (SKDownload) for this transaction
	public var (default, null) NSArray *downloads __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);

// The date when the transaction was added to the server queue.  Only valid if state is SKPaymentTransactionStatePurchased or SKPaymentTransactionStateRestored.
	public var (default, null) NSDate *transactionDate __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

// The unique server-provided identifier.  Only valid if state is SKPaymentTransactionStatePurchased or SKPaymentTransactionStateRestored.
	public var (default, null) NSString *transactionIdentifier __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

// Only valid if state is SKPaymentTransactionStatePurchased.
	public var (default, null) NSData *transactionReceipt __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

	public var (default, null) SKPaymentTransactionState transactionState __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);

}
