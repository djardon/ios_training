//
//  UsersDTO.swift
//  iOSClassCode
//
//  Created by David Jardon on 11/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation

struct UsersDTO: Codable {
    var users: [UserDTO]?
    var info: InfoDTO?
    
    
    private enum CodingKeys: String, CodingKey {
        case users = "results"
        case info
    }
}
