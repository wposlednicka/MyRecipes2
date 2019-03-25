//
//  Recipe.swift
//  MyRecipes2
//
//  Created by Wiktoria on 25/03/2019.
//  Copyright © 2019 Wiktoria. All rights reserved.
//

import UIKit

class Recipe {
    
    var name: String
    var image: UIImage
    var ingredients: [Ingredient]
    var description: String
    
    init(name: String, image: UIImage, ingredients: [Ingredient], description: String) {
        self.name = name
        self.image = image
        self.ingredients = ingredients
        self.description = description
    }
    
}
