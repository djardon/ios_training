//
//  LoginDTO.swift
//  iOSClassCode
//
//  Created by David Jardon on 11/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation

struct LoginDTO: Codable {
    let uuid, username, password, salt: String?
    let md5, sha1, sha256: String?
}
