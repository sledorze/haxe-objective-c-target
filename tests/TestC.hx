import objc.graphics.CGGeometry;

@:import("NSObjCRuntime.h")
@:include("objc/runtime.h")
class TestC {

	public function new () {
		
		var x = Math.random()*50;
		var y = Math.cos(x);
		var p = CGGeometry.CGPointMake(x,y);
	}
	
	
	// Test Math
	
	function testMath(){
		var pi = Math.PI;
		var max = Math.NEGATIVE_INFINITY;
		var min = Math.POSITIVE_INFINITY;
		var nan = Math.NaN;
		
		var x = Math.sqrt(5);
		x = Math.abs(5);
		x = Math.max (5, 45555);
		x = Math.min (5, 45555);
		x = Math.sin(5);
		x = Math.cos(5);
		x = Math.atan2(5, 3);
		x = Math.tan(5);
		x = Math.exp(5);
		x = Math.log(5);
		x = Math.sqrt(5);
		var xr = Math.round(5);
		xr = Math.floor(5);
		xr = Math.ceil(5);
		x = Math.atan(5);
		x = Math.asin(5);
		x = Math.acos(5);
		x = Math.pow(5, 4);
		x = Math.random()*5;
		var b = Math.isFinite (45454 );
		b = Math.isNaN (45454 );
		
		var j = x + xr;
		j += x;
		var k = b ? -x : x;
	}
	
}