//
//  NewRecipeStepTwoViewController.swift
//  MyRecipes2
//
//  Created by Wiktoria on 25/03/2019.
//  Copyright © 2019 Wiktoria. All rights reserved.
//

import UIKit
import os.log

class NewRecipeStepTwoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var addIngredientButton: UIButton!
    @IBOutlet weak var nextStepButton: UIBarButtonItem!
    
    var recipe: Recipe?
    var nameOne: String = ""
    var imageOne: UIImage?
    var ingredients: [Ingredient] = []
    let identifierSegueThree = "addNewRecipeThree"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.ingredientsTable.delegate = self
        self.ingredientsTable.dataSource = self
        self.ingredientsTable.separatorColor = UIColor.white
        self.ingredientsTable.rowHeight = UITableViewAutomaticDimension
        self.ingredientsTable.estimatedRowHeight = 600
        
        if let editRecipe = recipe {
            ingredients = editRecipe.ingredients!
        }
        
        updateNextButton()
    }
    
    private func updateNextButton(){
        nextStepButton.isEnabled = !ingredients.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifierSegueThree {
            let destinationNavigationController = segue.destination as? UINavigationController
            if let stepThreeController = destinationNavigationController?.topViewController as?NewRecipeStepThreeViewController {
                if let editRecipe = recipe {
                   // editRecipe.ingredients = ingredients
                    stepThreeController.recipe = editRecipe
                }
                else{
                    stepThreeController.nameOne = nameOne
                    stepThreeController.imageOne = imageOne
                    stepThreeController.ingredientsTwo = ingredients
                }
            }
        }
    }
    
    @IBAction func addNewIngredientToTable(sender: UIStoryboardSegue){
        if let sourceVC = sender.source as? NewIngredientViewController, let ingredient = sourceVC.ingredient {
            
            let newIndexPath = IndexPath(row: ingredients.count, section: 0)
            ingredients.append(ingredient)
            ingredientsTable.insertRows(at: [newIndexPath], with: .automatic)
            updateNextButton()
        }
    }
   
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "ingredientTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? IngredientTableViewCell else {
            fatalError("Problem with initialize ingredient cell")
        }
        
        let ingredient = ingredients[indexPath.row]
        cell.nameLabel.text = ingredient.name
        cell.amountLabel.text = ingredient.amount
        cell.unitLabel.text = ingredient.unit
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Uwaga!", message: "Czy chcesz usunac skladnik?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Nie", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Tak", style: UIAlertActionStyle.default, handler: { action in
            
            self.ingredients.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.updateNextButton()
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
