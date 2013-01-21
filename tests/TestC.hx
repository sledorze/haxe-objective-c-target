import objc.graphics.CGGeometry;

@:import("NSObjCRuntime.h")
@:include("NSObjCRuntime.h")
class TestC {

	public function new () {
		
		var x = Math.random()*50;
		var y = Math.cos(x);
		var p = CGGeometry.CGPointMake(x,y);
	}
}