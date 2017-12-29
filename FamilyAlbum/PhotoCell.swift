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
        photoLabel.text = album.message
        
        guard let pfFile = album.image else { return }
        pfFile.getDataInBackground { (data, error) in
            if let data = data {
                self.photoImage.image = UIImage(data: data)
            }
        }
    }

}
