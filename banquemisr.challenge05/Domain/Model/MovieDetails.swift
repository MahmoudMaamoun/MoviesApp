//
//  MovieDetails.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 30/08/2024.
//

import Foundation

struct MovieDetails {

    let title: String
    let id: Int
    let releaseDate: String
    let posterPath:String?
    let overview: String?
    var genres:[String]?
    var runtime: Int?
    var adult: Bool?
    let vote_average: Double?
    let vote_count: Int?
    
    init(title: String, id: Int, releaseDate: String, posterPath: String?, overview: String?, genres: [String]?, runtime: Int?, adult: Bool?, vote_average: Double?, vote_count: Int?) {
        self.title = title
        self.id = id
        self.releaseDate = releaseDate
        self.posterPath = posterPath
        self.overview = overview
        self.genres = genres
        self.runtime = runtime
        self.adult = adult
        self.vote_average = vote_average
        self.vote_count = vote_count
    }
  
    init(with movie:Movie){
        id = movie.id
        title = movie.title
        releaseDate = movie.releaseDate
        posterPath = movie.posterPath
        overview = movie.overview
        genres = nil
        runtime = nil
        adult = nil
        vote_count = nil
        vote_average = nil
    }
}
