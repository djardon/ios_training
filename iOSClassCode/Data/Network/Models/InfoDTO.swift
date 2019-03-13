//
//  InfoDTO.swift
//  iOSClassCode
//
//  Created by David Jardon on 11/03/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation

struct InfoDTO: Codable {
    let seed: String?
    let count, page: Int?
    let version: String?
    
    private enum CodingKeys: String, CodingKey {
        case seed
        case count = "results"
        case page
        case version
    }
}
