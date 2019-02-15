//
//  Photos.swift
//  Flickr
//
//  Created by Esra Karakeçili on 15.02.2019.
//  Copyright © 2019 Esra Karakeçili. All rights reserved.
//

import UIKit

class Photos: Decodable {
    var page: Int?
    var pages: Int?
    var perpage: Int?
    var total: Int?
    var photo: [Photo]?
}
