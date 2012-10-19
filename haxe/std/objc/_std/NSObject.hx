extern class NSObject {
	
	// Initializing a Class
	static function initialize () : Void;
	static function load () : Void;
	
	// Creating, Copying, and Deallocating Objects
	public function new () : Void;
	static function alloc () : Void;
	static function allocWithZone () : Void;
	public function init() :Void;
	public function copy () : Void;
	static function copyWithZone () : Void;
	function mutableCopy () : Void;
	public static function mutableCopyWithZone () : Void;
	function dealloc () : Void;
	function finalize () : Void;
	
	// Identifying Classes
	static function class_ () : Void;
	static function superclass () : Void;
	static function isSubclassOfClass () : Void;
	
	// Testing Class Functionality
	static function instancesRespondToSelector () : Void;
	
	// Testing Protocol Conformance
	static function conformsToProtocol () : Void;
	
	// Obtaining Information About Methods
	function methodForSelector () : Void;
	static function instanceMethodForSelector () : Void;
	static function instanceMethodSignatureForSelector () : Void;
	function methodSignatureForSelector () : Void;
	
	// Describing Objects
	static function description () : Void;
	
	// Discardable Content Proxy Support
	function autoContentAccessingProxy () : Void;
	
	// Sending Messages
/*	function performSelector:withObject:afterDelay:
	function performSelector:withObject:afterDelay:inModes:
	function performSelectorOnMainThread:withObject:waitUntilDone:
	function performSelectorOnMainThread:withObject:waitUntilDone:modes:
	function performSelector:onThread:withObject:waitUntilDone:
	function performSelector:onThread:withObject:waitUntilDone:modes:
	function performSelectorInBackground:withObject:
	static function cancelPreviousPerformRequestsWithTarget:
	static function cancelPreviousPerformRequestsWithTarget:selector:object:*/
	
	// Forwarding Messages
/*	function forwardingTargetForSelector:*/
/*	function forwardInvocation:*/
	
	// Dynamically Resolving Methods
/*	static function resolveClassMethod:*/
/*	static function resolveInstanceMethod:*/
	
	// Error Handling
/*	function doesNotRecognizeSelector:*/
	
	// Archiving
/*	function awakeAfterUsingCoder:*/
	function classForCoder () : Void;
	function classForKeyedArchiver () : Void;
	static function classFallbacksForKeyedArchiver () : Void;
	static function classForKeyedUnarchiver () : Void;
/*	function replacementObjectForCoder:*/
/*	function replacementObjectForKeyedArchiver:*/
/*	static function setVersion:*/
	static function version () : Void;
}
