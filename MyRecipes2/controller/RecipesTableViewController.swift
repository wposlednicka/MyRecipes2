//
//  RecipesTableViewController.swift
//  MyRecipes2
//
//  Created by Wiktoria on 25/03/2019.
//  Copyright © 2019 Wiktoria. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    
    var selectedRecipe: Recipe?
    var recipes: [Recipe] = []
    let identifierRecipeDetails = "showRecipeDetails"

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDummmyRecipe()
    }
    
    private func  loadDummmyRecipe(){
        
        let ingredients = [Ingredient.init(name: "maka", amount: "300", unit: "dag")]
         let ingredients2 = [Ingredient.init(name: "maslo", amount: "1", unit: "kg")]
        
        let recipe1 = Recipe(name: "Spaghetti", image: UIImage(named: "meal1")!, ingredients: ingredients, description: "fajny opis")
        
        let recipe2 = Recipe(name: "Schabowy", image: UIImage(named: "meal2")!, ingredients: ingredients2, description: "fajny opis schabowego")
        
        recipes += [recipe1, recipe2]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifierRecipeDetails {
            let destinationController = segue.destination as? RecipeDetailsViewController
            var row = self.tableView.indexPathForSelectedRow
            destinationController?.recipe = recipes[(row?.row)!]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "recipeTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? RecipeTableViewCell else {
            fatalError("Error with initialize recipeTebleViewCell")
        }
        
        let recipe = recipes[indexPath.row]
        cell.imageRecipe.image = recipe.image
        cell.nameRecipeLabel.text = recipe.name

        return cell
    }
    
    
    @IBAction func unwindToRecipeList(sender: UIStoryboardSegue){
        
        if let sourceViewController = sender.source as? NewRecipeStepThreeViewController, let recipe = sourceViewController.recipe {
            
            let newIndexPath = IndexPath(row: recipes.count, section: 0)
            recipes.append(recipe)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

 



}
