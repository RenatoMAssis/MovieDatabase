//
//  BaseMock.swift
//  NMDbTests
//
//  Created by Gian Nucci on 29/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

class BaseMock {
    
    var file: String
    var error: Error?
    var bundle: Bundle
    
    /// BaseMock Initializer
    ///
    /// - Parameters:
    ///   - file: file path
    ///   - error: error
    init(file: String = String(), error: Error? = nil, bundle: Bundle = Bundle.main) {
        self.file = file
        self.error = error
        self.bundle = bundle
    }
    
    /// Base response Mock used in Mock protocols
    ///
    /// - Returns: Optional Data
    /// - Throws: Business Error
    func loadResponse() throws -> Data? {
        
        if self.error != nil {
            throw self.error!
        }
        
        let dictionary = try json()
        return dictionary
    }
    
    /// Load json from file
    ///
    /// - Returns: Optional Data
    func json() throws -> Data {
        if let path = bundle.path(forResource: file, ofType: "json") {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return data
        } else {
            throw BusinessError.invalidValue
        }
    }
}
