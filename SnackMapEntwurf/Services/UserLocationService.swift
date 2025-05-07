//
//  UserLocationService.swift
//  SnackMapEntwurf
//
//  Created by Leonie Granz on 29.04.25.
//

import Foundation
import CoreLocation
import _MapKit_SwiftUI


class UserLocationService: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var location: CLLocation? {
        didSet {
            if cameraPosition == .automatic {
                updateMapCameraPosition()
            }
        }
    }
    
    @Published var cameraPosition: MapCameraPosition = .automatic
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
    
    private func updateMapCameraPosition() {
        guard let location = location else { return }
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        cameraPosition = .region(region)
    }
    
    
    
}
