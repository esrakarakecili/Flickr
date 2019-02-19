//
//  ViewController.swift
//  Flickr
//
//  Created by Esra Karakeçili on 7.02.2019.
//  Copyright © 2019 Esra Karakeçili. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var list: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FlickrHelper.getPictures(perPage: 20) { (photos) in
            self.list = photos
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 345
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ListTableCell") as? ListTableCell
        if cell == nil {
            tableView.register(UINib(nibName: "ListTableCell", bundle: nil), forCellReuseIdentifier: "ListTableCell")
            cell = tableView.dequeueReusableCell(withIdentifier: "ListTableCell") as? ListTableCell
        }
        
        let item = list[indexPath.row]
        cell!.lblNameSurname.text = item.title
        
        return cell!
    }
    
}

