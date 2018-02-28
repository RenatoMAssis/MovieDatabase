//
//  MovieBusiness.swift
//  NMDb
//
//  Created by Renato Miranda de Assis on 28/02/18.
//  Copyright © 2018 Renato Miranda de Assis. All rights reserved.
//

import Foundation

typealias MovieListUICallback = (@escaping () throws -> MovieList?) -> Void

class MovieBusiness {
    
    private var provider: MovieApiProtocol
    private var upcomingList: MovieList!
    private var popularList: MovieList!
    
    init(withProvider provider: MovieApiProtocol = MovieApiProvider()) {
        self.provider = provider
    }
    
    func upcomingMovies(refresh: Bool = false, _ completion: @escaping MovieListUICallback) {
        
        if refresh {
            self.upcomingList = nil
        }
        
        do {
            var upcomingRequest = MovieListRequest()
            
            if let currentUpcomingList = self.upcomingList {
                let currentPage = currentUpcomingList.page ?? 0
                let lastPage = currentUpcomingList.totalPages ?? Int.max
                
                if currentPage >= lastPage {
                    completion { currentUpcomingList }
                    return
                }
                
                upcomingRequest.page = currentPage + 1
            }
            
            let request = try JSONEncoder().encode(upcomingRequest)
            provider.upcomingMovies(withParameters:(nil, request), { [weak self] (result) in
                do {
                    guard let _self = self else { return }
                    
                    guard let upcomingResult = try result() else {
                        throw BusinessError.parse("Erro no parse: MovieBusiness.upcomingMovies")
                    }
                    
                    guard let upcomingList = try? JSONDecoder().decode(MovieList.self, from: upcomingResult) else {
                        throw BusinessError.parse("""
Erro no parse do objeto: MovieBusiness.upcomingMovies")
""")
                    }
                    
                    if _self.upcomingList == nil {
                        _self.upcomingList = upcomingList
                    }
                    
                    completion { _self.upcomingList }
                } catch {
                    fatalError("Deu Erro!")
                }
            })
        } catch {
            fatalError("Deu Erro!")
        }
    }
}
