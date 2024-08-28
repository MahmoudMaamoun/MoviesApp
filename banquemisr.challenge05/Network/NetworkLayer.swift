//
//  NetworkLayer.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 28/08/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case serverError
    case requestFailed(Error)
    case noData
    case decodingError(Error)
}

class NetworkLayer {
    typealias CompletionHandler<T> = (Result<T, NetworkError>) -> Void
    
    func get<T: Decodable>(urlString: String, responseType: T.Type, completion: @escaping CompletionHandler<T>) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.timeoutInterval = 30 // Customizable timeout
        // You can add headers if needed
        // request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.requestFailed(error)))
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
                    completion(.failure(.decodingError(error)))
                }
                
            } else {
                completion(.failure(.serverError))
            }
        }
        
        task.resume()
    }
}
