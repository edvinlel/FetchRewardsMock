//
//  Meal.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import Foundation

struct Meals: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}
