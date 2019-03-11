//
//  Student.swift
//  iOSClassCode
//
//  Created by David Jardon on 06/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation
import RealmSwift

class Student: Object {
    @objc dynamic var photo: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var year: String = ""
    @objc dynamic var comment: String = ""
    @objc dynamic var mark: Mark? = nil
    let subjects = List<Subject>()
    
    
    convenience init(photo: String, name: String, surname: String, year: String, comment: String, mark: Mark, subjects: Array<Subject>) {
        self.init()
        
        self.photo = photo
        self.name = name
        self.surname = surname
        self.year = year
        self.comment = comment
        self.mark = mark
        self.subjects.append(objectsIn: subjects)
    }
}
