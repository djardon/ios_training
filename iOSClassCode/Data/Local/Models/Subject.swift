//
//  Subject.swift
//  iOSClassCode
//
//  Created by David Jardon on 07/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation
import RealmSwift

class Subject: Object {
    @objc dynamic var image: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var year: String = ""
    @objc dynamic var comment: String = ""
    let students = LinkingObjects(fromType: Student.self, property: "subjects")
    
    
    convenience init(image: String, name: String, year: String, comment: String) {
        self.init()
        
        self.image = image
        self.name = name
        self.year = year
        self.comment = comment
    }
}
