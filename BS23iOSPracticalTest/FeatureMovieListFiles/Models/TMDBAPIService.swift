//
//  TMDBAPIService.swift
//  BS23iOSPracticalTest
//
//  Created by mac 2019 on 2/16/24.
//

import Foundation

class TMDBAPIService{
    
    static let shared = TMDBAPIService()
    
    func fetchDefaultMovies() async throws -> [MovieListItemViewModel]{
        return try await search(with: "Marvel")
    }
    
    func search(with key: String) async throws -> [MovieListItemViewModel] {
        
        let url = URL(string: Constants.TMDBSearchUrl+key)
        
        let responseData = try await URLSession.shared.data(for:  URLRequest(url: url!)).0
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(TMDBResponse.self, from: responseData)
            
        return response.results.map(MovieListItemViewModel.init)
    }
}
