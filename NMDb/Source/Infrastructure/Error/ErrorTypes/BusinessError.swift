//
//  BusinessError.swift
//  NMDb
//
//  Created by Renato Miranda de Assis on 28/02/18.
//  Copyright © 2018 Renato Miranda de Assis. All rights reserved.
//

import Foundation

enum BusinessError: Error {
    case parse(String)
    case invalidValue
    case offlineMode
}
