//
//  Credits.swift
//  NMDb
//
//  Created by Gian Nucci on 01/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

struct Credits: Codable {
    
    var identifier: Int?
    var castList: [Cast]?
    var crewList: [Crew]?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case castList = "cast"
        case crewList = "crew"
    }
}
