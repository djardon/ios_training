//
//  User.swift
//  iOSClassCode
//
//  Created by David Jardon on 20/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var gender: String? = nil
    @objc dynamic var address: String? = nil
    @objc dynamic var dob: Date? = nil
    @objc dynamic var phone: String? = nil
    @objc dynamic var mail: String? = nil
    @objc dynamic var nat: String? = nil
    @objc dynamic var latitude: String? = nil
    @objc dynamic var longitude: String? = nil
    
    
    convenience init(name: String, gender: String? = nil, address: String? = nil, dob: Date? = nil, phone: String? = nil, mail: String? = nil,
                     nat: String? = nil, latitude: String? = nil, longitude: String? = nil) {
        self.init()
        
        self.name = name
        self.gender = gender
        self.address = address
        self.dob = dob
        self.phone = phone
        self.mail = mail
        self.nat = nat
        self.latitude = latitude
        self.longitude = longitude
    }
}
