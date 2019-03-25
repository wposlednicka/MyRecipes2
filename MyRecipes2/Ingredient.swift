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
    var measure: String
    
    init(name: String, amount: String, measure: String) {
        self.name = name
        self.amount = amount
        self.measure = measure
    }
}
