//
//  MoviesCellViewModel.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 29/08/2024.
//

import Foundation

class MoviesCellViewModel {
    var id:Int
    var title:String
    var posterImage:String
    var releaseDate:String
    
    init(movie:Movie) {
        self.id = movie.id
        self.title = movie.title
        self.posterImage = movie.posterPath
        self.releaseDate = movie.releaseDate
    }
}
