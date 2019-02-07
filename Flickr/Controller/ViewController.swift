//
//  ViewController.swift
//  Flickr
//
//  Created by Esra Karakeçili on 7.02.2019.
//  Copyright © 2019 Esra Karakeçili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FlickrHelper.getPictures(perPage: 20) {
            
        }
    }


}

