//
//  ImageServices.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 30/08/2024.
//

import Foundation
import UIKit

protocol ImageServicesProtocol {
    func loadImage(from url: String, completion: @escaping (Data?) -> Void)
}

class ImageService: ImageServicesProtocol {
    static let shared = ImageService()
    private let imageCache = NSCache<NSString, UIImage>()

    private init() {}

    func loadImage(from url: String, completion: @escaping (Data?) -> Void) {
        let cacheKey = NSString(string: url)

        // Check if the image is cached
        if let cachedImage = imageCache.object(forKey: cacheKey) {
            completion(cachedImage.pngData())
            return
        }

        // If not cached, download the image
        guard let imageUrl = URL(string: "\(Constants.shared.IMAGE_BASE_URL)\(url)") else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard error == nil, let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }

            // Cache the image
            self.imageCache.setObject(image, forKey: cacheKey)

            // Return the image data
            DispatchQueue.main.async {
                completion(image.pngData())
            }
        }
        task.resume()
    }
}
