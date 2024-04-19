//
//  CocktailModels.swift
//  CocktailApp
//
//  Created by user235857 on 4/19/24.
//

import Foundation


class CocktailListResponse: Codable {
    var drinks: [Cocktail]?
}

class Cocktail: Codable {
    var idDrink: String
    var strDrink: String
    var strCategory: String?
    var strAlcoholic: String?
    var strInstructions: String?
    var strInstructionsES: String?
    var strInstructionsDE: String?
    var strDrinkThumb: String?
}
