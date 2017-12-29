//
//  AddPhotoViewController.swift
//  FamilyAlbum
//
//  Created by admin on 12/28/17.
//  Copyright © 2017 kimboss. All rights reserved.
//

import UIKit
import Parse

class AddPhotoViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choosePhoto(_ sender: Any) {
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
    
    @IBAction func post(_ sender: Any) {
        guard let message = captionLabel.text, let image = imageView.image else{
            Helper.shared.showOKAlert(title: "Invalid submission", message: "Must input an image and caption label", viewController: self)
            return
        }
        let album = Albums()
        album.message = message
        album.image = PFFile(name: "photo.png", data: UIImagePNGRepresentation(image)!)
        album.saveInBackground()
        captionLabel.text = nil
        imageView.image = nil
    }
    
}

extension AddPhotoViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
            return
        }
        imageView.image = image
        dismiss(animated: true, completion: nil)
    }


}

