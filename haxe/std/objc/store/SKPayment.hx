package objc.message;

import objc.foundation.NSObject;
import objc.foundation.NSData;


extern class SKPayment extends NSObject, implements NSCopying/*, NSMutableCopying>*/ {

	public static function paymentWithProduct (product:SKProduct) :SKPayment;

	public var productIdentifier :String;
	public var requestData :NSData;
	public var quantity :Int;

}


extern class SKMutablePayment extends SKPayment {

	public var productIdentifier :String;
	public var quantity :Int;
	public var requestData :NSData;

}
