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
    var owner: Any
    var secret: String?
    var server: String?
    var farm: Int?
    var title: String?
    var isPublic: Int?
    var isFriend: Int?
    var isFamily: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, owner, secret, server, farm, title, isPublic, isFriend, isFamily
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            // FIXME: Decoding
            id = try? container.decode(String.self, forKey: .id)
            
            if let stringOwner = try? container.decode(String.self, forKey: .owner) {
                owner = stringOwner
            } else if let objectOwner = try? container.decode(Owner.self, forKey: .owner) {
                owner = objectOwner
            } else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Not a JSON"))
            }
            
            secret = try? container.decode(String.self, forKey: .secret)
            server = try? container.decode(String.self, forKey: .server)
            farm = try? container.decode(Int.self, forKey: .farm)
            title = try? container.decode(String.self, forKey: .title)
            isPublic = try? container.decode(Int.self, forKey: .isPublic)
            isFriend = try? container.decode(Int.self, forKey: .isFriend)
            isFamily = try? container.decode(Int.self, forKey: .isFamily)
        }
    }
    
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
