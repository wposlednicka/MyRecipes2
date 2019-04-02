//
//  ViewController.swift
//  MyRecipes2
//
//  Created by Wiktoria on 25/03/2019.
//  Copyright © 2019 Wiktoria. All rights reserved.
//

import UIKit
import os.log

class NewRecipeStepOneViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameRecipeTextField: UITextField!
    @IBOutlet weak var imageRecipeImage: UIImageView!
    @IBOutlet weak var nextStepButton: UIBarButtonItem!
    
    var recipe: Recipe?
    let identifierStepTwo = "addNewRecipeTwo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let editRecipe = recipe {
            nameRecipeTextField.text = editRecipe.name
            imageRecipeImage.image = editRecipe.image
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let name = nameRecipeTextField.text!
        let image = imageRecipeImage.image!
        
        if segue.identifier == identifierStepTwo {
            let destinationNavigationController = segue.destination as? UINavigationController
            if let targetController = destinationNavigationController?.topViewController as?NewRecipeStepTwoViewController{
                
                if let editRecipe = recipe {
                    editRecipe.name = name
                    editRecipe.image = image
                    targetController.recipe = editRecipe
                }
                else{
                    targetController.nameOne = name
                    targetController.imageOne = image
                }
            }
        }
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

