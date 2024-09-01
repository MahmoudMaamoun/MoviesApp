//
//  MoviesRepository.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 29/08/2024.
//

import Foundation
protocol MoviesRepository {
    func fetchMovies(category:MovieCategory,page:Int,completion: @escaping(Result<MoviePage,MoviesError>) -> Void)
    func fetchMovieDetails(movieId: Int, completion: @escaping(Result<MovieDetails, MoviesError>) -> Void)
}
