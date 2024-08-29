//
//  ImageCache.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 29/08/2024.
//

import UIKit

class ImageCache {
    
    private let cache = NSCache<NSString,UIImage>()
    
    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: NSString(string: key))
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: NSString(string: key))
    }
}
