//
//  FetchMoviesUseCase.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 29/08/2024.
//

import Foundation
enum MovieCategory {
    case upComming
    case popular
    case nowPlaying
}
class FetchMoviesUseCase {
    private let movieRepository: MoviesRepository
    
    init(movieRepository: MoviesRepository) {
        self.movieRepository = movieRepository
    }

    func execute(category:MovieCategory,page:Int,completion: @escaping (Result<MoviePage, Error>) -> Void) {
        movieRepository.fetchMovies(category: category, page:page,completion: completion)
    }
}
