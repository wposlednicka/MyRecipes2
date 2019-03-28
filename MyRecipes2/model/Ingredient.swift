//
//  Ingredient.swift
//  MyRecipes2
//
//  Created by Wiktoria on 25/03/2019.
//  Copyright © 2019 Wiktoria. All rights reserved.
//

import UIKit

class Ingredient {
    
    var name: String
    var amount: String
    var unit: String
    
    init(name: String, amount: String, unit: String) {
        self.name = name
        self.amount = amount
        self.unit = unit
    }
}

enum Unit: String {
    typealias RawValue = String
    case number = "szt."
    case kilo = "kg"
    case gram = "g"
    case ounce = "dag"
    case liter = "litr"
    case spoon = "lyzka"
    case teaspoon = "lyzeczka"
    case dram = "szczypta"
}
