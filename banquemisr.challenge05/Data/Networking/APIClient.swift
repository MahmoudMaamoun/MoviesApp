//
//  APIClient.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 29/08/2024.
//

import Foundation

class APIClient {
    private let networkLayer = NetworkLayer()
    
    func fetchNowPlayingMovies(completion: @escaping (Result<MovieResponse, NetworkError>) -> Void) {
        let urlString = "\(Constants.shared.NOW_PLAYING_API)?api_key=\(Constants.shared.apiKey)"
        networkLayer.get(urlString: urlString, responseType: MovieResponse.self) { result in
            switch(result){
            case .success(let moviesResponse):
                completion(.success(moviesResponse))
                return
            case .failure(let error):
                completion(.failure(error))
                return
            }
        }
    }
    
    func fetchPopularMovies(completion: @escaping (Result<MovieResponse, NetworkError>) -> Void) {
        let urlString = Constants.shared.POPULAR_Api
        networkLayer.get(urlString: urlString, responseType: MovieResponse.self) { result in
            switch(result){
            case .success(let moviesResponse):
                completion(.success(moviesResponse))
                return
            case .failure(let error):
                completion(.failure(error))
                return
            }
        }
    }
    
    func fetchUpCommingMovies(completion: @escaping (Result<MovieResponse, NetworkError>) -> Void) {
        let urlString = Constants.shared.UP_COMMING_API
        networkLayer.get(urlString: urlString, responseType: MovieResponse.self) { result in
            switch(result){
            case .success(let moviesResponse):
                completion(.success(moviesResponse))
                return
            case .failure(let error):
                completion(.failure(error))
                return
            }
        }
    }
}
