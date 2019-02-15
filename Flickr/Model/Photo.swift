//
//  Photo.swift
//  Flickr
//
//  Created by Esra Karakeçili on 12.02.2019.
//  Copyright © 2019 Esra Karakeçili. All rights reserved.
//

import UIKit

class Photo: Decodable {
    var id: String?
    var owner: String?
    var secret: String?
    var server: String?
    var farm: Int?
    var title: String?
    var isPublic: Int?
    var isFriend: Int?
    var isFamily: Int?
    
//    init(json:[String: Any]?) {
//        guard let json = json else { return }
//        id = json["id"] as? Int ?? -1
//        owner = json["owner"] as? Int ?? -1
//        secret = json["secret"] as? String ?? ""
//        server = json["server"] as? String ?? ""
//        farm = json["farm"] as? Int ?? -1
//        title = json["title"] as? String ?? ""
//        isPublic = json["ispublic"] as? Int ?? -1
//        isFriend = json["isfriend"] as? Int ?? -1
//        isFamily = json["isfamily"] as? Int ?? -1
//    }
}
