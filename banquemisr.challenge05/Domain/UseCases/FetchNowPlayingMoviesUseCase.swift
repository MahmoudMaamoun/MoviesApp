//
//  FetchMoviesUseCase.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 29/08/2024.
//

import Foundation

class FetchNowPlayingMoviesUseCase {
    private let movieRepository: MoviesRepository

    init(movieRepository: MoviesRepository) {
        self.movieRepository = movieRepository
    }

    func execute(completion: @escaping (Result<[Movie], Error>) -> Void) {
        movieRepository.fetchMovies(type: "NowPlaying", completion: completion)
    }
}
