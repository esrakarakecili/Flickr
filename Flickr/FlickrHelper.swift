//
//  FlickrHelper.swift
//  Flickr
//
//  Created by Esra Karakeçili on 7.02.2019.
//  Copyright © 2019 Esra Karakeçili. All rights reserved.
//

import Foundation

class FlickrHelper {
    
    class func urlToGetRecentPictures(perPage: Int) -> String {
        return "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=\(flickrAPIKey)&per_page=\(perPage)&format=json&nojsoncallback=1"
    }
    
    class func urlToSearchPicture(searchString: String, perPage: Int) -> String {
        let encodedSearchString = searchString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(flickrAPIKey)&text=\(encodedSearchString)&per_page=\(perPage)&format=json&nojsoncallback=1"
    }
    
    class func urlToGetPhotoInfo(id: String) -> String {
        return "https://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=\(flickrAPIKey)&photo_id=\(id)&format=json&nojsoncallback=1"
    }
    
    class func generatePhotoUrl(id: String, server: String, secret: String, size: PhotoSize) -> String {
        return "https://live.staticflickr.com/\(server)/\(id)_\(secret)_\(getPhotoSize(size)).jpg"
    }
    
    class func generateProfilePicture(iconFarm: String, iconServer: String, nsid: String) -> String {
        return "http://farm\(iconFarm).staticflickr.com/\(iconServer)/buddyicons/\(nsid).jpg"
    }
    
    class func getPictures(perPage: Int, completion: @escaping (_ photos: [Photo]) -> Void) {
        guard let url = URL(string: urlToGetRecentPictures(perPage: 20)) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(RecentPhotos.self, from: data)
                print(json)
                
                // FIXME: Get Info
//                guard let photos = json.photos?.photo else { return }
//                for currentPhoto in photos {
//                    getInfo(photoId: currentPhoto.id!, completion: { (photo) in
//                        currentPhoto = photo!
                        completion(json.photos?.photo ?? [])
//                    })
//                }
            } catch let jsonError {
                print(jsonError)
            }
            }.resume()
    }
    
    class func getInfo(photoId: String, completion: @escaping (_ photo: Photo?) -> Void) {
        guard let url = URL(string: urlToGetPhotoInfo(id: photoId)) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(Photo.self, from: data)
                print(json)
                completion(json)
                
            } catch let jsonError {
                print(jsonError)
            }
            }.resume()
    }
}

