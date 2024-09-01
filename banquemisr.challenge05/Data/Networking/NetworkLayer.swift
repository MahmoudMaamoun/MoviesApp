//
//  NetworkLayer.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 28/08/2024.
//

import Foundation


class NetworkLayer {
    typealias CompletionHandler<T> = (Result<T, MoviesError>) -> Void
    
    func get<T: Decodable>(urlString: String, responseType: T.Type, completion:@escaping (Result<T, MoviesError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.timeoutInterval = 10 // Customizable timeout
        // You can add headers if needed
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(Constants.shared.accessToken, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.requestFaild(error.localizedDescription)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }

            if (200...299).contains(httpResponse.statusCode) {
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                do {
                    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedResponse))
                } catch(let error) {
                    completion(.failure(.decodingError(error.localizedDescription)))
                }
                
            } else {
                completion(.failure(.serverError(httpResponse.statusCode)))
            }
        }
        
        task.resume()
    }
}
