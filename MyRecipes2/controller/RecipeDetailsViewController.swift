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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ingredientsTableView.delegate = self
        self.ingredientsTableView.dataSource = self
        self.nameLabel.text = recipe?.name
        self.descriptionLabel.text = recipe?.description
        self.ingredientsTableView.separatorColor = UIColor.white
        //UIColor(red:0.37, green:0.62, blue:0.63, alpha:1.0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (recipe?.ingredients?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifierCell = "ingredientCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath) as? IngredientTableViewCell else {
            fatalError("Error with initialize IngredientTableViewCell")
        }
        
        let ingredient = recipe?.ingredients![indexPath.row]
        cell.amountLabel.text = ingredient?.amount
        cell.nameLabel.text = ingredient?.name
        cell.unitLabel.text = ingredient?.unit
        
        return cell
    }
    
    
  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
