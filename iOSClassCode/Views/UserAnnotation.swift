//
//  UserAnnotation.swift
//  iOSClassCode
//
//  Created by David Jardon on 19/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation
import MapKit

class UserAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
