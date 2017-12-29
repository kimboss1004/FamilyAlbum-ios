//
//  ViewController.swift
//  FamilyAlbum
//
//  Created by admin on 12/27/17.
//  Copyright © 2017 kimboss. All rights reserved.
//

import UIKit
import Parse
class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var albums = [Albums]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAlbums()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAlbums(){
        let query = Albums.query()!
        query.findObjectsInBackground { (objects, error) in
            if let objs = objects as? [Albums] {
                self.albums = objs
                self.tableView.reloadData()
            }
        }
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        cell.setAlbum(album: albums[indexPath.row])
        
        return cell
    }
}

