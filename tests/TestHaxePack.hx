/*@:import("NSObjCRuntime.h")
@:import("NSObjCRuntime2.h")
@:include("objc/runtime.h")*/
class TestHaxePack {

	public function new () {
		
	}
	
	
	// Test haxe.Timer
	function testTimer () {
		var timer = new haxe.Timer ( 50 );
		timer.run = testTimerLoop;
		timer.stop();
		timer = haxe.Timer.delay (testTimerLoop, 50);
		timer = haxe.Timer.delay ( function() { testTimerLoop(); }, 50);
		haxe.Timer.measure (testTimerLoop);
		var f = haxe.Timer.stamp();
	}
	function testTimerLoop () {}
		
		
		
	function testCrypto () {
		var str1 = haxe.crypto.Md5.encode("Hello world");
		var str2 = haxe.crypto.Sha1.encode("Hello world");
	}
	
	
	
	// Test Resources
	function testResources () {
		var str = haxe.Resource.getString("welcome");
		trace(str);
	}
	
	
	// Test Callstack
	function testCallstack () {
		var arr = haxe.CallStack.callStack();
	}
	
}