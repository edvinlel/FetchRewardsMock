//
//  CategoryType.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import Foundation

enum CategoryType: String {
    case beef = "Beef"
    case chicken = "Chicken"
    case dessert = "Dessert"
    case lamb = "Lamb"
    case miscellaneous = "Miscellaneous"
    case pasta = "Pasta"
    case pork = "Pork"
    case seafood = "Seafood"
    case side = "Side"
    case starter = "Starter"
    case vegan = "Vegan"
    case vegetarian = "Vegetarian"
    case breakfast = "Breakfast"
    case goat = "Goat"
    
    var endpoint: String {
        return "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(self.rawValue)"
    }
}
