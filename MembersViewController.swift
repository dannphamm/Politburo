//
//  MembersViewController.swift
//  Politburo
//
//  Created by Dung Pham on 5/16/17.
//  Copyright © 2017 Dung Pham. All rights reserved.
//

import UIKit

class MembersViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var membersImage: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    @IBAction func Photos(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary // pick the image from  photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        membersImage.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    } // this func is used to move image from photoLirary to the image slot in membersViewConrollor
    
    @IBAction func Camera(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let member = Members(context: context)
        member.name = nameTextField.text
        member.image = UIImagePNGRepresentation(membersImage.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
    
}



