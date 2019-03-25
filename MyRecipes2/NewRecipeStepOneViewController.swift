//
//  ViewController.swift
//  MyRecipes2
//
//  Created by Wiktoria on 25/03/2019.
//  Copyright © 2019 Wiktoria. All rights reserved.
//

import UIKit

class NewRecipeStepOneViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameRecipeTextField: UITextField!
    @IBOutlet weak var imageRecipeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        nameRecipeTextField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following:\(info)")
        }
        imageRecipeImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
}

