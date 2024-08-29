//
//  MoviesCellViewModel.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 29/08/2024.
//

import Foundation
import UIKit

class MoviesCellViewModel {
    var id:Int
    var title:String
    var posterImage:String
    var releaseDate:String
    var imageURL:String
    private let imageCache: ImageCache
    
    init(movie:Movie) {
        self.id = movie.id
        self.title = movie.title
        self.posterImage = movie.posterPath
        self.imageURL = "\(Constants.shared.IMAGE_BASE_URL)\(movie.posterPath)"
        self.releaseDate = movie.releaseDate
        self.imageCache = ImageCache()
    }
    
    func loadImage(into imageView: UIImageView) {
           guard let url = URL(string: imageURL) else { return }
           
           // Check if the image is cached
           if let cachedImage = imageCache.image(forKey: posterImage) {
               imageView.image = cachedImage
               return
           }
           
           // Fetch the image
           let task = URLSession.shared.dataTask(with: url) { data, response, error in
               guard let data = data, error == nil, let image = UIImage(data: data) else {
                   return
               }
               
               // Cache the image
               self.imageCache.setImage(image, forKey: self.posterImage)
               
               // Update the image view on the main thread
               DispatchQueue.main.async {
                   imageView.image = image
               }
           }
           
           task.resume()
       }
   }

