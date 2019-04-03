//
//  RecipeDetailsViewController.swift
//  MyRecipes2
//
//  Created by Wiktoria on 27/03/2019.
//  Copyright © 2019 Wiktoria. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UIViewController, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingredientsTableView: UITableView!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    var recipe: Recipe?
    let identifierEdit = "editRecipe"
    let identifierCell = "ingredientCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = recipe?.name
        self.descriptionLabel.text = recipe?.description
        self.ingredientsTableView.delegate = self
        self.ingredientsTableView.dataSource = self
        self.ingredientsTableView.separatorColor = UIColor.white
        self.ingredientsTableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (recipe?.ingredients?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath) as? IngredientTableViewCell else {
            fatalError("Error with initialize IngredientTableViewCell")
        }
        
        let ingredient = recipe?.ingredients![indexPath.row]
        cell.amountLabel.text = ingredient?.amount
        cell.nameLabel.text = ingredient?.name
        cell.unitLabel.text = ingredient?.unit
        
        return cell
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifierEdit {
            if  let destinationVC = segue.destination as? NewRecipeStepOneViewController {
                destinationVC.recipe = recipe
            }
        }
    }
 

}
