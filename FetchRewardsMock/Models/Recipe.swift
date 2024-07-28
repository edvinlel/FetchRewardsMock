//
//  Recipe.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import Foundation

struct Recipes: Codable {
    let meals: [Recipe]
}

struct Recipe: Codable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
    let strYoutube: String?
    let strSource: String?

    var ingredients: [String] = []
    var measures: [String] = []

    private enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strInstructions, strMealThumb, strYoutube, strSource
    }

    // I noticed in the API that strIngredient and strMeasure could be used twenty
    // times or it could be used five times. I wanted to find a way to loop through
    // the JSON and only create the model if needed. Through my research, I found this
    // online and have found it to be a cleaner way of going about this.
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        strYoutube = try container.decodeIfPresent(String.self, forKey: .strYoutube)
        strSource = try container.decodeIfPresent(String.self, forKey: .strSource)
        
        let dynamicContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)
        
        for index in 1...20 {
            let ingredientKey = DynamicCodingKeys(stringValue: "strIngredient\(index)")!
            let measureKey = DynamicCodingKeys(stringValue: "strMeasure\(index)")!
            
            if let ingredient = try dynamicContainer.decodeIfPresent(String.self, forKey: ingredientKey)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient.isEmpty,
               let measure = try dynamicContainer.decodeIfPresent(String.self, forKey: measureKey)?.trimmingCharacters(in: .whitespacesAndNewlines), !measure.isEmpty {
                ingredients.append(ingredient)
                measures.append(measure)
            }
        }
        struct DynamicCodingKeys: CodingKey {
            var stringValue: String
            init?(stringValue: String) {
                self.stringValue = stringValue
            }

            var intValue: Int?
            init?(intValue: Int) {
                return nil
            }
        }
    }
}
