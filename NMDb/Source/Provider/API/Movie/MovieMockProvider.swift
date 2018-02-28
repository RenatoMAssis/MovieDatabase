//
//  MovieMockProvider.swift
//  NMDb
//
//  Created by Gian Nucci on 02/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

/// Mock Provider for Mock Enviroiment and UITests
class MovieMockProvider: BaseMock, MovieApiProtocol {
    
    func upcomingMovies(withParameters parameters: NetworkParameters,
                        _ completion: @escaping MovieCallback) {
        self.file = "upcoming"
        completion { try loadResponse() }
    }
    
    func popularMovies(withParameters parameters: NetworkParameters,
                       _ completion: @escaping MovieCallback) {
        self.file = "popular"
        completion { try loadResponse() }
    }
    
    func movie(withParameters parameters: NetworkParameters, movieId: String,
               _ completion: @escaping MovieCallback) {
        self.file = "movie"
        completion { try loadResponse() }
    }
    
    func credits(withParameters parameters: NetworkParameters, movieId: String,
                 _ completion: @escaping MovieCallback) {
        self.file = "credits"
        completion { try loadResponse() }
    }
}
