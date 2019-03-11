//
//  Mark.swift
//  iOSClassCode
//
//  Created by David Jardon on 08/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation
import RealmSwift

class Mark: Object {
    @objc dynamic var mark: Float = 0.0
    @objc dynamic var markDescription: String {
        get {
            var message = ""
            switch mark {
                case 0.0..<5.0:
                    message = "Suspenso"
                
                case 5.0..<7.0:
                    message = "Aprobado"
                
                case 7.0..<8.0:
                    message = "Bien"
                
                case 8.0..<9.0:
                    message = "Notable"
                
                case 9.0..<10.1:
                    message = "Sobresaliente"
                
                default:
                    message = "Pendiente"
            }
            
            return message
        }
    }
    let students = LinkingObjects(fromType: Student.self, property: "mark")
    
    
    convenience init(mark: Float) {
        self.init()
        
        self.mark = mark
    }
}
