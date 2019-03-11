//
//  Teacher.swift
//  iOSClassCode
//
//  Created by David Jardon on 07/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation
import RealmSwift

class Teacher: Object {
    @objc dynamic var photo: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var year: String = ""
    @objc dynamic var comment: String = ""
    let subjects = List<Subject>()
    
    
    convenience init(photo: String, name: String, surname: String, year: String, comment: String, subjects: Array<Subject>) {
        self.init()
        
        self.photo = photo
        self.name = name
        self.surname = surname
        self.year = year
        self.comment = comment
        self.subjects.append(objectsIn: subjects)
    }
}
