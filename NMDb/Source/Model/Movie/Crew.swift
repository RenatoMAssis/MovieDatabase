//
//  Crew.swift
//  NMDb
//
//  Created by Gian Nucci on 01/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

struct Crew: Codable {

    var job: String?
    var name: String?
    var profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case job
        case name
        case profilePath = "profile_path"
    }
}
