//
//  MovieListViewModel.swift
//  KobeMovieApp
//
//  Created by Vinicius Valvassori on 08/07/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

final class MovieDetailsViewModel {
    var moviesService: MoviesServiceDelegate
    var movie: Movie?
    var error = ""
    
    init(movieId: Int, moviesService: MoviesServiceDelegate = MoviesService()) {
        self.moviesService = moviesService
        moviesService.fetchMovieDetails(byId: movieId) { result in
            switch result{
            case .success(let movie):
                self.movie = movie
            case .failure(let error):
                self.error = error.localizedDescription
                print(self.error)
            }
        }
    }
    
}
