//
//  TMDBAPIService.swift
//  BS23iOSPracticalTest
//
//  Created by mac 2019 on 2/16/24.
//

import Foundation

class TMDBAPIService{
    
    static let shared = TMDBAPIService()
    
    func search(with key: String) async throws -> [MovieListItemViewModel] {
        
        let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=38e61227f85671163c275f9bd95a8803&query="+key)
        
        let responseData = try await URLSession.shared.data(for:  URLRequest(url: url!)).0
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(TMDBResponse.self, from: responseData)
            
        return response.results.map(MovieListItemViewModel.init)
    }
}
