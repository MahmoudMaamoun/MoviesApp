//
//  FetchMoviesUseCase.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 29/08/2024.
//

import Foundation

class FetchNowPlayingMoviesUseCase {
    private let movieRepository: MoviesRepository
    private var page:Int = 1
    
    init(movieRepository: MoviesRepository) {
        self.movieRepository = movieRepository
    }

    func execute(completion: @escaping (Result<MoviePage, Error>) -> Void) {
        movieRepository.fetchMovies(page:page , completion: completion)
    }
}
