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
    var imageURL:String
    var overview:String?
    
    private let imageService: ImageServicesProtocol

    init(movie:Movie) {
        self.id = movie.id
        self.title = movie.title
        self.overview = movie.overview
        self.posterImage = (movie.posterPath ?? "")!
        self.imageURL = "\(Constants.shared.IMAGE_BASE_URL)\(self.posterImage)"
        self.releaseDate = movie.releaseDate
        self.imageService = ImageService.shared
    }
    func loadImage(completion: @escaping (Data?) -> Void) {
        imageService.loadImage(from: imageURL, completion: completion)
    }
   }

