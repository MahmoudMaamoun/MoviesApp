//
//  MovieError.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 01/09/2024.
//

import Foundation

enum MoviesError: Error {
    case invalidUrl
    case requestFaild(String)
    case decodingError(String)
    case invalidResponse
    case serverError(Int)
    case noData
    
    var localizedDescription: String {
        switch self {
        case .invalidUrl:
            return "The URL provided is invalid."
        case .requestFaild(let message):
            return "The Request failed with \(message)"
        case .decodingError(let message):
            return "Failed to decode response \(message)"
        case .invalidResponse:
            return "Received an invalid responnse from the server"
        case .serverError(let message):
            return "Server Error with status code: \(message)"
        case .noData:
            return "No data recieved From The Server"
        }
    }
}
