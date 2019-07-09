//
//  MovieListViewModel.swift
//  KobeMovieApp
//
//  Created by Vinicius Valvassori on 08/07/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

protocol MovieListViewModelProtocol: class {
    var loading: Bool { get }
    var movies: [Movie] { get }
}

final class MovieListViewModel {
    var moviesService: MoviesServiceDelegate
    var movies: [Movie] = []
    var error: String = ""
    var selectedMovie: Movie?
    
    init(moviesService: MoviesServiceDelegate = MoviesService()) {
        self.moviesService = moviesService
        moviesService.fetchMovies { result in
            switch result{
            case .success(let movies):
                self.movies = movies
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
}
