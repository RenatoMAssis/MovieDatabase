//
//  MovieListRequest.swift
//  NMDb
//
//  Created by Gian Nucci on 01/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import UIKit

struct MovieListRequest: Codable {

    let apiKey = ApiProvider.apiSecret
    var page: Int?
    
    init(withPage page: Int = 1) {
        self.page = page
    }
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case page
    }
    
}
