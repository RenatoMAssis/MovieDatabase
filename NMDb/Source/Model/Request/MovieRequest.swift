//
//  MovieRequest.swift
//  NMDb
//
//  Created by Gian Nucci on 01/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

struct MovieRequest: Codable {

    let apiKey = ApiProvider.apiSecret
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
    }
}
