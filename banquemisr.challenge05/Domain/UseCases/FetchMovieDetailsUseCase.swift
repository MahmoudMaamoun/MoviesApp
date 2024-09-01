//
//  FetchMovieDetailsUseCase.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 30/08/2024.
//

import Foundation
class FetchMovieDetailsUseCase {
    
    private let moviesRepositiory:MoviesRepository
    
    init(moviesRepositiory: MoviesRepository) {
        self.moviesRepositiory = moviesRepositiory
    }
    
    func excute(movieId:Int,completion:@escaping (Result<MovieDetails,MoviesError>)->()){
        moviesRepositiory.fetchMovieDetails(movieId: movieId, completion: completion)
    }
}
