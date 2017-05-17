//
//  MembersViewController.swift
//  Politburo
//
//  Created by Dung Pham on 5/16/17.
//  Copyright © 2017 Dung Pham. All rights reserved.
//

import UIKit

class MembersViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addUpdateButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var membersImage: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var member : Members? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        if member != nil {
            membersImage.image = UIImage(data: member!.image as! Data)
            nameTextField.text = member!.name
            addUpdateButton.setTitle("Update", for: .normal)
        } else {
            deleteButton.isHidden = true
        }
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
        
        imagePicker.sourceType = .camera // su dung camera trong iphone
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        if member != nil {
            member!.name = nameTextField.text
            member!.image = UIImagePNGRepresentation(membersImage.image!) as NSData?
            
        } else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            
            let member = Members(context: context)
            member.name = nameTextField.text
            member.image = UIImagePNGRepresentation(membersImage.image!) as NSData?
        }
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(member!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true) 
    }
}





