
import ios.map.MKMapView;

class CustomMapView extends MKMapView {
	
	public function locateLondon () :Void {
		locate (50.8, -0.5, 1.2);
	}
	public function locate (lat:Float, long:Float, zoom:Float) {
		
/*	    var zoomIn = this.region;
	    zoomIn.center.latitude = lat;
	    zoomIn.center.longitude = long;
	    zoomIn.span.latitudeDelta = 0.006;
	    zoomIn.span.longitudeDelta = 0.006;
    
	    this.setRegion (zoomIn, true);
	
	    var cloc :CLLocationCoordinate2D = null;
	    cloc.latitude = latitude;
	    cloc.longitude = longitude;
		
		var addAnnotation = new AddressAnnotation().initWithCoordinate ( cloc );
		this.addAnnotation(addAnnotation);*/
	}
	
/*	map = [[MKMapView alloc] initWithFrame:CGRectMake(1, 1, mapContainer.frame.size.width-2, mapContainer.frame.size.height-2)];
	    map.showsUserLocation = YES;*/
	
}
