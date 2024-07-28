//
//  Category.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import Foundation

struct Categories: Codable {
    let categories: [Category]
}

struct Category: Codable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}
