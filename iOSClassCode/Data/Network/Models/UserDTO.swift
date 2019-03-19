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
    let email: String?
    let dob, registered: DobDTO?
    let phone, cell: String?
    let picture: PictureDTO?
    let nat: String?
    let location: LocationDTO?

    // Hide because service return some
    // errors with this data
    //let id: IdDTO?
    //let login: LoginDTO?
}
