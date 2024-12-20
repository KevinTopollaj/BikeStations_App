//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import CoreLocation

final class LocationManager: NSObject, ObservableObject {
	
	@Published var authorizationStatus: CLAuthorizationStatus
	@Published var userLocation: CLLocation?
	
	private let cllLocationManager: CLLocationManager
	
	init(authorizationStatus: CLAuthorizationStatus = .notDetermined) {
		self.authorizationStatus = authorizationStatus
		self.cllLocationManager = CLLocationManager()
		super.init()
		cllLocationManager.delegate = self
		cllLocationManager.desiredAccuracy = kCLLocationAccuracyReduced
		self.authorizationStatus = cllLocationManager.authorizationStatus
		cllLocationManager.startUpdatingLocation()
	}
	
	func updateAuthorizationStatus() {
		authorizationStatus = cllLocationManager.authorizationStatus
	}
	
	func requestWhenInUseAuthorization() {
		cllLocationManager.requestWhenInUseAuthorization()
	}
	
	func distance(from userLocation: CLLocation, to station: StationEntity) -> CLLocationDistance {
		let stationLocation = CLLocation(latitude: station.latitude, longitude: station.longitude)
		return userLocation.distance(from: stationLocation)
	}
	
}

// MARK: - Location status -

extension LocationManager {
	var locationIsDisabled: Bool {
		authorizationStatus == .notDetermined ||
		authorizationStatus == .restricted
	}
}

// MARK: - CLLocationManagerDelegate -

extension LocationManager: CLLocationManagerDelegate {
	
	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		
		updateAuthorizationStatus()
		
		if manager.authorizationStatus == .denied {
			userLocation = nil
		}
		
	}
	
	func locationManager(_ manager: CLLocationManager,
											 didUpdateLocations locations: [CLLocation]) {
		
		guard let location = locations.first else { return }
		userLocation = location
	}
	
	func locationManager(_ manager: CLLocationManager,
											 didFailWithError error: Error) {
		
		print("Location retrieving failed due to: \(error.localizedDescription)")
		
	}
}

