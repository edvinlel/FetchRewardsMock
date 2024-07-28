//
//  NetworkManager.swift
//  FetchRewardsMock
//
//  Created by Edvin on 7/28/24.
//

import Foundation

struct NetworkManager {
    static func fetchData<T: Codable>(from url: URL, decodeTo type: T.Type) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    }
}
