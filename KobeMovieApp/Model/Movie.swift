//
//  Movie.swift
//  KobeMovieApp
//
//  Created by Vinicius Valvassori on 08/07/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class Movie: Codable {
    var voteCount: Int?
    var id: Int?
    var video: Bool?
    var voteAverage: Double?
    var title: String?
    var popularity: Double?
    var posterPath: String?
    var originalLanguage: String?
    var originalTitle: String?
    var genreIds: [Int]?
    var backdropPath: String?
    var adult: Bool?
    var overview: String?
    var releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id
        case video
        case voteAverage = "vote_average"
        case title
        case popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIds = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult
        case overview
        case releaseDate = "release_date"
    }
    
    let genreDict: Dictionary<Int, String> =
        [28: "Action",
         12: "Adventure",
         16: "Animation",
         35: "Comedy"]
}

struct Results: Decodable {
    let results: [Movie]
}

