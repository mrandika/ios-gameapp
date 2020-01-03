//
//  ImageLoader.swift
//  GameDB
//
//  Created by Andika on 03/01/20.
//  Copyright © 2020 Andika. All rights reserved.
//

import Foundation
import UIKit

class ImageLoader: ObservableObject {
    private static let imageCache = NSCache<AnyObject, AnyObject>()
    
    @Published var image: UIImage? = nil
    
    public func downloadImage(url: URL) {
        let urlString = url.absoluteString
        
        if let imageFromCache = ImageLoader.imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                ImageLoader.imageCache.setObject(image, forKey: urlString as AnyObject)
                self?.image = image
            }
        }.resume()
    }
}
