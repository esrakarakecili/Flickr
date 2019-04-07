//
//  Utils.swift
//  Flickr
//
//  Created by Esra Karakecili on 6.04.2019.
//  Copyright © 2019 Esra Karakeçili. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func imageFromUrl(_ urlString: String, placeHolder: UIImage?, completion: @escaping (_ downloadedImage: UIImage) -> Void) {
        self.image = nil
        if placeHolder != nil {
            self.image = placeHolder
        }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            self.image = cachedImage
            return
        }
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                //print("RESPONSE FROM API: \(response)")
                if error != nil {
                    print("Error loading images from url: \(error)")
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: urlString))
                            self.image = downloadedImage
                            completion(downloadedImage)
                        }
                    }
                }
            }).resume()
        }
    }
}
