//
//  Cast.swift
//  NMDb
//
//  Created by Gian Nucci on 01/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

struct Cast: Codable {
    
    var character: String?
    var name: String?
    var profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case character
        case name
        case profilePath = "profile_path"
    }
}
