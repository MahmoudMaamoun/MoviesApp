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
    
    func fetchMovies(type: String, completion: @escaping (Result<[Movie], any Error>) -> Void) {
        
        apiClient.fetchNowPlayingMovies { result in
            switch(result) {
            case .success(let moviesRep):
                let movies = moviesRep.results.map {$0.toDomainModel()}
                completion(.success(movies))
                return
            case .failure(let err):
                completion(.failure(err))
                return
            }
        }
    }
    
}
