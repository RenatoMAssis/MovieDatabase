//
//  MovieManager.swift
//  NMDb
//
//  Created by Renato Miranda de Assis on 28/02/18.
//  Copyright © 2018 Renato Miranda de Assis. All rights reserved.
//

import Foundation

class MovieManager: OperationQueue {
    
    private lazy var business: MovieBusiness = {
        return MovieBusiness()
    }()
    
    func upcomingMovies(refresh: Bool = false, _ completion: @escaping MovieListUICallback) {
        addOperation {
            self.business.upcomingMovies(refresh: refresh, { (discover) in
                OperationQueue.main.addOperation {
                    completion(discover)
                }
            })
        }
    }
}
