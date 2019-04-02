//
//  NewRecipeStepThreeViewController.swift
//  MyRecipes2
//
//  Created by Wiktoria on 25/03/2019.
//  Copyright © 2019 Wiktoria. All rights reserved.
//

import UIKit
import os.log

class NewRecipeStepThreeViewController: UIViewController, UITextViewDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    let descriptionPlaceholder = "Opis"
    let placeholderColor = UIColor.lightGray
    let textColor = UIColor.black
    
    var nameOne: String?
    var imageOne: UIImage?
    var ingredientsTwo: [Ingredient]?
    var recipe: Recipe?
    var newRecipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionTextView.delegate = self
        descriptionTextView.text = descriptionPlaceholder
        descriptionTextView.textColor = placeholderColor
        if let editRecipe = recipe {
            descriptionTextView.text = editRecipe.description
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, canceling", log: OSLog.default, type: .debug)
            return
        }
        
        let desc = descriptionTextView.text!
        
        if let editRecipe = recipe {
            editRecipe.description = desc
            recipe = editRecipe
        }
        else{
            newRecipe = Recipe(name: nameOne!, image: imageOne!, ingredients: ingredientsTwo!, description: desc)
        }
        
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == placeholderColor {
            textView.text = nil
            textView.textColor = textColor
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = descriptionPlaceholder
            textView.textColor = placeholderColor
        }
    }

}
