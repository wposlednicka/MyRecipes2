//
//  NewIngredientViewController.swift
//  MyRecipes2
//
//  Created by Wiktoria on 28/03/2019.
//  Copyright © 2019 Wiktoria. All rights reserved.
//

import UIKit
import os.log

class NewIngredientViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var unitIngredientPicker: UIPickerView!
    @IBOutlet weak var amountIngredientTextField: UITextField!
    @IBOutlet weak var nameIngredientTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var unitPickerData: [String] = []
    var ingredient: Ingredient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.unitIngredientPicker.delegate = self
        self.unitIngredientPicker.dataSource = self

        loadPickerData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIButton, button === saveButton else {
            os_log("The save button was not pressed, canceling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameIngredientTextField.text!
        let amount = amountIngredientTextField.text!
        let selectedRow = unitIngredientPicker.selectedRow(inComponent:0)
        let unit = unitPickerData[selectedRow]
        
        ingredient = Ingredient(name: name, amount: amount, unit: unit)
        
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
    
    private func loadPickerData(){
        unitPickerData = [Unit.number.rawValue, Unit.kilo.rawValue, Unit.ounce.rawValue, Unit.gram.rawValue,                        Unit.dram.rawValue, Unit.liter.rawValue, Unit.spoon.rawValue, Unit.teaspoon.rawValue]
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
