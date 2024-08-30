//
//  FetchMoviesRepositoriy.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 29/08/2024.
//

import Foundation

class MoviesDataRepositoriy : MoviesRepository {
    private let apiClient:APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchMovies(category:MovieCategory, page: Int, completion: @escaping (Result<MoviePage, any Error>) -> Void) {
        
        apiClient.fetchMovies(category: category,page:page) { result in
            switch(result) {
            case .success(let moviesRep):
                let movies = moviesRep.results.map {$0.toDomainModel()}
                let moviePage = MoviePage(movies: movies, currentPage: moviesRep.page, totalPages: moviesRep.totalPages)
                completion(.success(moviePage))
                return
            case .failure(let err):
                completion(.failure(err))
                return
            }
        }
    }
    
}
