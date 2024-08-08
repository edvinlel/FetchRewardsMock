//
//  ImageLoader.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import UIKit

class ImageLoader {
    private var imageCache = NSCache<NSURL, UIImage>()
    
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = imageCache.object(forKey: url as NSURL) {
            completion(cachedImage)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self?.imageCache.setObject(image, forKey: url as NSURL)
            
            DispatchQueue.main.async {
                completion(image)
            }
        }
        
        task.resume()
    }
}
