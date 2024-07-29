//
//  NetworkManager.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import Foundation

struct NetworkManager {
    private func fetchData<T: Codable>(from url: URL, decodeTo type: T.Type) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    }
    
    func fetchMeals(for category: CategoryType) async throws -> [Meal] {
        guard let url = URL(string: category.endpoint) else {
            throw URLError(.badURL)
        }
        
        let response = try await fetchData(from: url, decodeTo: Meals.self)
        return response.meals
    }
    
    func fetchCategories() async throws -> [Category] {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else {
            throw URLError(.badURL)
        }
        
        let categories = try await fetchData(from: url, decodeTo: Categories.self)
        return categories.categories
            
    }
    
    func fetchRecipes(withId id: String) async throws -> [Recipe] {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            throw URLError(.badURL)
        }
        
        let recipes = try await fetchData(from: url, decodeTo: Recipes.self)
        return recipes.meals
    }
}
