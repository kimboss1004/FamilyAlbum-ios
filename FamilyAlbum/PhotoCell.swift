//
//  PhotoCell.swift
//  FamilyAlbum
//
//  Created by admin on 12/28/17.
//  Copyright © 2017 kimboss. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    func setAlbum(album: Albums){
        photoImage.image = album.image?.getDataInBackground()
        photoLabel.text = album.message
    }

}
