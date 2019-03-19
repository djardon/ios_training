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

    
    private let regionRadius: CLLocationDistance = 100_000

    
    // MARK: - Lifecycle -
    override func prepareForReuse() {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCornerAndShadow(view: mView)
    }
    
    
    // MARK: - Configure methods -
    func configureCell(data: UserDTO) {
        guard let latitude = Double(data.location?.coordinates?.latitude ?? ""),
              let longitude = Double(data.location?.coordinates?.longitude ?? "") else {
            return
        }
        
        // Create location coordinates
        let userLocation = CLLocation(latitude: latitude, longitude: longitude)
        centerMapOnLocation(location: userLocation)
        addUserMapMark(data: data, userLocation: userLocation)
    }
    
    // MARK: - Private methods -
    private func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        // Set map region center and radius
        mMapView?.setRegion(coordinateRegion, animated: true)
    }
    
    private func addUserMapMark(data: UserDTO, userLocation: CLLocation) {
        // show user location on map
        guard let title = data.name?.title,
            let name = data.name?.first,
            let surname = data.name?.last else {
                return
        }
        
        // Create map annotation with user data
        let userMark = UserAnnotation(title: "\(title.capitalized) \(name.capitalized)",
                                      locationName: "\(surname.capitalized)",
                                      coordinate: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude,
                                                                         longitude: userLocation.coordinate.longitude))
        // Add annotation to map view
        mMapView?.addAnnotation(userMark)
    }
}
