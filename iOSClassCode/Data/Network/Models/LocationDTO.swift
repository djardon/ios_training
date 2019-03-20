//
//  LocationDTO.swift
//  iOSClassCode
//
//  Created by David Jardon on 11/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation

struct LocationDTO: Codable {
    let street, city, state: String?
    let coordinates: CoordinatesDTO?
    
    // Hide because service return some
    // errors with this data
    //let postcode: Int?
    //let timezone: TimezoneDTO?
}
