//
//  MoviesRepository.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 29/08/2024.
//

import Foundation
protocol MoviesRepository {
    func fetchMovies(type:String,completion: @escaping(Result<[Movie],Error>) -> Void)
}
