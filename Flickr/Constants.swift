//
//  Constants.swift
//  Flickr
//
//  Created by Esra Karakeçili on 7.02.2019.
//  Copyright © 2019 Esra Karakeçili. All rights reserved.
//

import Foundation

let flickrAPIKey = "49fb47894065a80d933e7232acf4aad7"

enum PhotoSize {
    case square, largeSquare, thumbnail, small, medium, large, original
}

func getPhotoSize(_ size: PhotoSize) -> String {
    switch size {
    case .square:
        return "s"
    case .largeSquare:
        return "q"
    case .thumbnail:
        return "t"
    case .small:
        return "n"
    case .medium:
        return "z"
    case .large:
        return "b"
    case .original:
        return "o"
    }
}
