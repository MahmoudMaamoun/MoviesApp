//
//  APIClient.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 29/08/2024.
//

import Foundation

class APIClient {
    private let networkLayer = NetworkLayer()
    
    func fetchMovies(category:MovieCategory,page:Int,completion: @escaping (Result<MovieResponse, NetworkError>) -> Void) {
        let endPoint:String
        switch category {
        case .nowPlaying:
            endPoint = Constants.shared.NOW_PLAYING_API
        case .popular :
            endPoint = Constants.shared.POPULAR_Api
        case .upComming:
            endPoint = Constants.shared.UP_COMMING_API
        }
        
        let urlString = "\(endPoint)?page=\(page)&api_key=\(Constants.shared.apiKey)"
        
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
