//
//  HomeCollectionViewController.swift
//  NMDb
//
//  Created by Renato Miranda de Assis on 28/02/18.
//  Copyright © 2018 Renato Miranda de Assis. All rights reserved.
//

import Foundation
import UIKit

class HomeCollectionViewController: UICollectionViewController {
    
    private lazy var manager: MovieManager = {
        return MovieManager()
    }()
    
    private var upcomingMovies: [Movie]? {
        didSet {
            if upcomingMovies != nil {
                collectionView?.reloadData()
            }
        }
    }
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self,
                                 action: #selector(HomeCollectionViewController.refresh),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = .white
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.refreshControl = refreshControl
        loadMovies()
    }
    
    func loadMovies(refresh: Bool = false) {
        manager.upcomingMovies(refresh: refresh) { [weak self] (result) in
            guard let _self = self else { return }
            
            do {
                guard let movieList = try result() else {
                    throw BusinessError.invalidValue
                }
                _self.upcomingMovies = movieList.results
            } catch {
                fatalError("error")
            }
            _self.refreshControl.endRefreshing()
        }
    }
    
    @objc private func refresh() {
        loadMovies(refresh: true)
    }
}

// MARK: - UICollectionViewDataSource
extension HomeCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Teste",
                                                      for: indexPath)
        cell.backgroundColor = UIColor.black
        // Configure the cell
        return cell
    }
}
