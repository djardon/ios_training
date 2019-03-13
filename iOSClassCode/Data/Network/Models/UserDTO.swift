//
//  UserDTO.swift
//  iOSClassCode
//
//  Created by David Jardon on 11/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation

struct UserDTO: Codable {
    let gender: String?
    let name: NameDTO?
    let location: LocationDTO?
    let email: String?
    let login: LoginDTO?
    let dob, registered: DobDTO?
    let phone, cell: String?
    let id: IdDTO?
    let picture: PictureDTO?
    let nat: String?
}
