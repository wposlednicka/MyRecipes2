//
//  NewRecipeStepTwoViewController.swift
//  MyRecipes2
//
//  Created by Wiktoria on 25/03/2019.
//  Copyright © 2019 Wiktoria. All rights reserved.
//

import UIKit
import os.log

class NewRecipeStepTwoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var unitIngredientPicker: UIPickerView!
    @IBOutlet weak var amountIngredientTextField: UITextField!
    @IBOutlet weak var nameIngredientTextField: UITextField!
   
    
    var unitPickerData: [String] = []
    var ingredients: [Ingredient] = []
   
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
        
        let ingre = ingredients[indexPath.row]
        cell.nameLabel.text = ingre.name
        cell.amountLabel.text = ingre.amount
        cell.unitLabel.text = ingre.unit
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.unitIngredientPicker.delegate = self
        self.unitIngredientPicker.dataSource = self
        self.ingredientsTable.delegate = self
        self.ingredientsTable.dataSource = self
        loadPickerData()
        // Do any additional setup after loading the view.
    }
    
    private func loadPickerData(){
        unitPickerData = [Unit.szt.rawValue, Unit.kg.rawValue, Unit.dag.rawValue,
                          Unit.litr.rawValue, Unit.lyzka.rawValue, Unit.lyzeczka.rawValue, Unit.szczypta.rawValue]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
