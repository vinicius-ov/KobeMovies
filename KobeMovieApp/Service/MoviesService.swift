//
//  MoviesService.swift
//  KobeMovieApp
//
//  Created by Vinicius Valvassori on 08/07/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import Foundation

typealias CompletionMovies = ((ApiResult<[Movie]>) -> Void)
typealias CompletionMovieDetails = ((ApiResult<Movie>) -> Void)

protocol MoviesServiceDelegate: AnyObject {
    func fetchMovies(completion: @escaping CompletionMovies)
    func fetchMovieDetails(byId id:Int, completion: @escaping CompletionMovieDetails)
}

final class MoviesService {
    let baseUrlList = "/upcoming"
    let baseUrlAuthParams = "?api_key=c5850ed73901b8d268d0898a8a9d8bff&language=en-US"
    let baseUrl =  "https://api.themoviedb.org/3/movie"
    
    private var delegate: ApiRequestDelegate?
    
    init(delegate: ApiRequestDelegate = ApiRequest()) {
        self.delegate = delegate
    }
}

extension MoviesService: MoviesServiceDelegate {
    func fetchMovies(completion: @escaping CompletionMovies) {
        delegate?.request(withUrl: "\(baseUrl)\(baseUrlList)\(baseUrlAuthParams)", andCompletion: { (data, error) in
            guard let jsonData = data, let movies = try? JSONDecoder().decode(Results.self, from: jsonData) else{
                completion(ApiResult.failure(ResultError.data(message: "Falha no decode")))
                return
            }
            completion(ApiResult.success(movies.results))
        })
    }
    
    func fetchMovieDetails(byId id: Int, completion: @escaping CompletionMovieDetails) {
        delegate?.request(withUrl: "\(baseUrl)/\(id)\(baseUrlAuthParams)", andCompletion: { (data, error) in
            guard let jsonData = data, let movieDetails = try? JSONDecoder().decode(Movie.self, from: jsonData) else{
                completion(ApiResult.failure(ResultError.data(message: "Falha no decode")))
                return
            }
            completion(ApiResult.success(movieDetails))
        })
    }
    
}
