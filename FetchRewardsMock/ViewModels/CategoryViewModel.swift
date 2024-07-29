//
//  CategoryViewModel.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import Foundation

class CategoryViewModel {
    private var networkManager = NetworkManager()
    private(set) var allCategories = [Category]()

    func fetchCategories() async {
        do {
            allCategories = try await networkManager.fetchCategories()
        } catch {
            print("error fetching categories: \(error)")
        }
    }
}
