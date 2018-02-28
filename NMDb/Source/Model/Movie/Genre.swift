//
//  Genre.swift
//  NMDb
//
//  Created by Gian Nucci on 01/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import UIKit

struct Genre: Codable {
    
    var identifier: Int?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
    }
}
