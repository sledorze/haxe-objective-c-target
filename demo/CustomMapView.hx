
import ios.map.MKMapView;

class CustomMapView extends MKMapView {
	
	public function locateLondon () :Void {
		locate (50.8, -0.5, 1.2);
	}
	public function locate (lat:Float, long:Float, zoom:Float) {
		
	    MKCoordinateRegion zoomIn = map.region;
	    zoomIn.center.latitude = latitude;
	    zoomIn.center.longitude = longitude;
	    zoomIn.span.latitudeDelta = 0.006;
	    zoomIn.span.longitudeDelta = 0.006;
    
	    [map setRegion:zoomIn animated:YES];
	
	    CLLocationCoordinate2D cloc;
	    cloc.latitude = latitude;
	    cloc.longitude = longitude;
	    AddressAnnotation *addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:cloc];
	    [map addAnnotation:addAnnotation];
	    [addAnnotation release];
	}
	
	map = [[MKMapView alloc] initWithFrame:CGRectMake(1, 1, mapContainer.frame.size.width-2, mapContainer.frame.size.height-2)];
	    map.showsUserLocation = YES;
	
}
