//
//  CategoryViewModel.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import Foundation

class CategoryViewModel {
    private var networkManager = NetworkManager()
    private var allCategories = [Category]()
    
    // Here I am just removing Dessert from the array of categories from its original
    // index of three to be the first thing displayed per requirements.
    var categories: [String] {
        var categoryArray = [String]()
        for i in allCategories {
            categoryArray.append(i.strCategory)
        }
        
        if let index = categoryArray.firstIndex(of: "Dessert") {
            categoryArray.insert(categoryArray.remove(at: index), at: 0)
        }
        
        return categoryArray
    }

    func fetchCategories() async {
        do {
            allCategories = try await networkManager.fetchCategories()
        } catch {
            print("error fetching categories: \(error)")
        }
    }
    
    func getCategoryName(at index: Int) -> String {
        return categories[index]
    }
}
