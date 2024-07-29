//
//  RecipeViewModel.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import Foundation

class RecipeViewModel {
    private var networkManager = NetworkManager()
    private(set) var recipes = [Recipe]()
    
    func fetchRecipes(withId id: String) async {
        do {
            recipes = try await networkManager.fetchRecipes(withId: id)
        } catch {
            // Handle error
            print("Failed to fetch recipes: \(error)")
        }
    }
}
