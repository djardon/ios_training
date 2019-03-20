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
    @objc dynamic var gender: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var dob: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var mail: String = ""
    @objc dynamic var nat: String = ""
    @objc dynamic var latitude: String = ""
    @objc dynamic var longitudee: String = ""
    
}
