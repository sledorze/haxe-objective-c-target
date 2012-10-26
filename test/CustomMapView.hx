
import objc.ios.map.MKMapView;

class CustomMapView extends MKMapView {
	
	public function locateLondon () :Void {
		locate (50.8, -0.5, 1.2);
	}
	public function locate (lat:Float, long:Float, zoom:Float) {
	}
}