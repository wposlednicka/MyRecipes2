//
//  NewRecipeStepTwoViewController.swift
//  MyRecipes2
//
//  Created by Wiktoria on 25/03/2019.
//  Copyright © 2019 Wiktoria. All rights reserved.
//

import UIKit
import os.log

class NewRecipeStepTwoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var unitIngredientPicker: UIPickerView!
    @IBOutlet weak var amountIngredientTextField: UITextField!
    @IBOutlet weak var nameIngredientTextField: UITextField!
    
    var nameOne: String = ""
    var imageOne: UIImage?
    var unitPickerData: [String] = []
    var ingredients: [Ingredient] = []
    let identifierSegueThree = "addNewRecipeThree"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.unitIngredientPicker.delegate = self
        self.unitIngredientPicker.dataSource = self
        self.ingredientsTable.delegate = self
        self.ingredientsTable.dataSource = self
        loadPickerData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifierSegueThree {
            let destinationNavigationController = segue.destination as? UINavigationController
            if let stepThreeController = destinationNavigationController?.topViewController as?NewRecipeStepThreeViewController {
                
                stepThreeController.nameOne = nameOne
                stepThreeController.imageOne = imageOne
                stepThreeController.ingredientsTwo = ingredients
            }
        }
    }
   
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }    
   
    @IBAction func addIngredientToTable(_ sender: UIButton) {
        let name = nameIngredientTextField.text!
        let amount = amountIngredientTextField.text!
        let selectedRow = unitIngredientPicker.selectedRow(inComponent:0)
        let unit = unitPickerData[selectedRow]
        
        let ingredient = Ingredient(name: name, amount: amount, unit: unit)
        
        let newIndex = IndexPath(row: ingredients.count, section: 0)
        ingredients.append(ingredient)
        ingredientsTable.insertRows(at: [newIndex], with: .automatic)
        
        os_log("The ingredient save button was pressed", log: OSLog.default, type: .debug)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return unitPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return unitPickerData[row]
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
    
    private func loadPickerData(){
        unitPickerData = [Unit.number.rawValue, Unit.kilo.rawValue, Unit.ounce.rawValue, Unit.gram.rawValue,                        Unit.dram.rawValue, Unit.liter.rawValue, Unit.spoon.rawValue, Unit.teaspoon.rawValue]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
