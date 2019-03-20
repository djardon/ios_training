//
//  UserMapTableViewCell.swift
//  iOSClassCode
//
//  Created by David Jardon on 19/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit
import MapKit

class UserMapTableViewCell: UITableViewCell {
    // MARK: - Class -
    static let mIdentifier: String = String(describing: UserMapTableViewCell.self)
    static let mEstimatedHeight: CGFloat = 350.0
    
    // MARK: - IBOutlets -
    @IBOutlet weak var mView: UIView?
    @IBOutlet weak var mMapView: MKMapView?


    // MARK: - Properties -
    private let regionRadius: CLLocationDistance = 100_000
    private var userLocation: CLLocation? = nil
    private let madridLocation = CLLocation(latitude: 41.381653,
                                            longitude: 2.123764)
    private let barcelonaLocation = CLLocation(latitude: 40.454148,
                                               longitude: -3.688387)
    
    
    // MARK: - Lifecycle -
    override func prepareForReuse() {
        userLocation = nil
        mMapView?.delegate = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCornerAndShadow(view: mView)
        // Apply corner radius to MapView
        mMapView?.layer.cornerRadius = 8.0
        mMapView?.delegate = self
    }
    
    
    // MARK: - Configure methods -
    func configureCell(data: UserDTO) {
        guard let latitude = Double(data.location?.coordinates?.latitude ?? ""),
              let longitude = Double(data.location?.coordinates?.longitude ?? "") else {
            return
        }
        
        // Create location coordinates
        userLocation = CLLocation(latitude: latitude, longitude: longitude)
        
        if let location = userLocation {
            centerMapOnLocation(location: location)
            addUserMapMark(data: data, userLocation: location)
            
            // Only for show sample directions over the map between custom locations
            showRouteOnMap(originCoordinate: madridLocation.coordinate,
                           destinationCoordinate: barcelonaLocation.coordinate)
        }
    }
    
    // MARK: - Private methods -
    private func centerMapOnLocation(location: CLLocation) {
        // Create and set map region to center map in this location
        //let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
        //                                          latitudinalMeters: regionRadius,
        //                                          longitudinalMeters: regionRadius)
        //mMapView?.setRegion(coordinateRegion, animated: true)
    }
    
    private func addUserMapMark(data: UserDTO, userLocation: CLLocation) {
        // show user location on map
        guard let title = data.name?.title,
            let name = data.name?.first,
            let surname = data.name?.last,
            let street = data.location?.street,
            let city = data.location?.city,
            let state = data.location?.state else {
                return
        }
        

        // Create map annotation with user data
        let userMark = UserAnnotation(title: "\(title.capitalized) \(name.capitalized) \(surname.capitalized)",
                                      locationName: "\(street), \(city), \(state)",
                                      coordinate: userLocation.coordinate)
        // Add annotation to map view
        mMapView?.addAnnotation(userMark)
    }
}


// MARK: - User Map TableViewCell Extension -
extension UserMapTableViewCell: MKMapViewDelegate {
    
    // MapView delegate method, called when map already loaded
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        // Use map camera to center map with animation when map loaded
        /*if let location = userLocation {
            MKMapCamera(lookingAtCenter: location,
                        fromDistance: 80_000,
                        pitch: 90.0,
                        heading: 0)
 
        }
         */
    }
    
    // MapView delegate method, called when render map view
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // Create and customize directions guide color and width
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor(red: 17.0/255.0,
                                       green: 147.0/255.0,
                                       blue: 255.0/255.0,
                                       alpha: 1)
        renderer.lineWidth = 4.0
        
        return renderer
    }
    
    
    // Show route on map
    func showRouteOnMap(originCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        // Create placeMark origin and destination
        let sourcePlacemark = MKPlacemark(coordinate: originCoordinate, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate, addressDictionary: nil)
        
        addPointAnnotations(originMark: sourcePlacemark,
                            destinationMark: destinationPlacemark)
        
        
        // Create mapItem origin and destination
        let directionData = directions(from: MKMapItem(placemark: sourcePlacemark),
                                       to: MKMapItem(placemark: destinationPlacemark))

        calculateDirections(directionData: directionData)
    }
    
    private func addPointAnnotations(originMark: MKPlacemark, destinationMark: MKPlacemark) {
        // Create origin PointAnnotation with coordinates
        let sourceAnnotation = MKPointAnnotation()
        if let location = originMark.location {
            sourceAnnotation.coordinate = location.coordinate
        }
        
        // Create destination PointAnnotation with coordinates
        let destinationAnnotation = MKPointAnnotation()
        if let location = destinationMark.location {
            destinationAnnotation.coordinate = location.coordinate
        }
        
        // Add all points annotation to the MapView
        mMapView?.showAnnotations([sourceAnnotation, destinationAnnotation], animated: true )
    }
    
    private func directions(from: MKMapItem, to: MKMapItem) -> MKDirections {
        // Create direction request with origin and destitantion
        let directionRequest = MKDirections.Request()
        directionRequest.source = from
        directionRequest.destination = to
        directionRequest.transportType = .any
        
        // Calculate the direction
        return MKDirections(request: directionRequest)

    }
    
    private func calculateDirections(directionData: MKDirections) {
        directionData.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            // Add route overlay for first route option
            let route = response.routes[0]
            self.mMapView?.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            // Get polyline rect to set map visible region
            // including Origin and Destination marks
            //let rect = route.polyline.boundingMapRect
            //self.mMapView?.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
}
