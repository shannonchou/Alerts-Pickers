import Foundation
import CoreLocation

// class because protocol
public class Location: NSObject {
	public let name: String?
	
	// difference from placemark location is that if location was reverse geocoded,
	// then location point to user selected location
	public let location: CLLocation
	public let placemark: CLPlacemark
	
	public var address: String {
        return "\(coordinate.latitude), \(coordinate.longitude)"
	}
	
	public init(name: String?, location: CLLocation? = nil, placemark: CLPlacemark) {
		self.name = name
		self.location = location ?? placemark.location!
		self.placemark = placemark
	}
}

import MapKit

extension Location: MKAnnotation {
    
    @objc public var coordinate: CLLocationCoordinate2D {
		return location.coordinate
	}
	
    public var title: String? {
		return address
	}
}
