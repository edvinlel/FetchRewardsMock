//
//  MealViewModel.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import Foundation

class MealViewModel {
    private var networkManager = NetworkManager()
    private(set) var allMeals = [Meal]()
    
    var displayedMeals: [Meal] {
        return Array(allMeals.prefix(10))
    }
    
    func fetchMeals(for category: CategoryType) async {
        do {
            allMeals = try await networkManager.fetchMeals(for: category)
        } catch {
            print("error fetching meals: \(error)")
        }
    }
    
}
