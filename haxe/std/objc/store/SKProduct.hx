package objc.message;

import objc.foundation.NSObject;
//#import <StoreKit/StoreKitDefines.h>

extern class SKProduct extends NSObject {

	public var localizedDescription :String;
	public var localizedTitle :String;
	public var price :NSDecimalNumber;
	public var priceLocale :NSLocale
	public var productIdentifier :String;
	public var downloadable :Bool;
	public var downloadContentLengths :NSArray;
	public var downloadContentVersion :String;

}
