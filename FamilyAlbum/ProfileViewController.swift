//
//  ProfileViewController.swift
//  FamilyAlbum
//
//  Created by admin on 12/28/17.
//  Copyright © 2017 kimboss. All rights reserved.
//

import UIKit
import ParseUI
import Parse

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: PFImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true)
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension ProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else { return }
        profileImage.image = image

        dismiss(animated: true, completion: nil)
    }
}

