//
//  FlickrHelper.swift
//  Flickr
//
//  Created by Esra Karakeçili on 7.02.2019.
//  Copyright © 2019 Esra Karakeçili. All rights reserved.
//

import Foundation
import AFNetworking

class FlickrHelper {
    
    class func urlToGetRecentPictures(perPage: Int) -> String {
        return "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=\(flickrAPIKey)&per_page=\(perPage)&format=json&nojsoncallback=1"
    }
    
    class func urlToSearchPicture(searchString: String, perPage: Int) -> String {
        return "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(flickrAPIKey)&text=\(searchString)&per_page=\(perPage)&format=json&nojsoncallback=1"
    }
    
    class func getPictures(perPage: Int, completion: () -> Void) {
        let manager = AFHTTPSessionManager()
    
        manager.get(urlToGetRecentPictures(perPage: perPage),
                    parameters: nil,
                    progress: nil,
                    success: { (operation, response) in
                        if let dictionary = response as? [String: Any] {
                            print(dictionary)
                        }
        }) { (operation, error) in
            print("Error: \(error)")
        }
    }
}

