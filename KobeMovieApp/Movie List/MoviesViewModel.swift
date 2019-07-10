//
//  MovieListViewModel.swift
//  KobeMovieApp
//
//  Created by Vinicius Valvassori on 08/07/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

protocol MoviesViewModelProtocol: class {
    var loading: Bool { get }
    var movies: [Movie] { get }
}

final class MoviesViewModel {
    var moviesService: MoviesServiceDelegate
    var movies: [Movie] = []
    var error: String = ""
    var isFiltering = false
    var initialList: [Movie] = []
    
    init(moviesService: MoviesServiceDelegate = MoviesService()) {
        self.moviesService = moviesService
        moviesService.fetchMovies { result in
            switch result{
            case .success(let movies):
                self.movies = movies
                self.initialList = movies
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadTable"), object: nil)
            case .failure(let error):
                self.error = error.localizedDescription
                print(self.error)
            }
        }
    }
    
    func movieListSize() -> Int {
        return movies.count
    }
    
    func movieByIndex(index: Int) -> Movie {
        return movies[index]
    }
    
}
