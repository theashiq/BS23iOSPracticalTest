//
//  MovieListItemViewModel.swift
//  BS23iOSPracticalTest
//
//  Created by mac 2019 on 2/16/24.
//

import Foundation

struct MovieListItemViewModel: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let posterImageUrl: String
}

extension MovieListItemViewModel{
    init(movie: TMDBMovie){
        title = movie.title ?? "Unknown Movie Title"
        description = movie.overview ?? ""
        posterImageUrl = movie.posterUrl
    }
}


extension MovieListItemViewModel{
    static var dummies: [MovieListItemViewModel]{
        return [
        
            .init(title: "Dummy Movie 1", description: "Dummy description", posterImageUrl: ""),
            .init(title: "Dummy Movie 2", description: "Dummy description", posterImageUrl: ""),
            .init(title: "Dummy Movie 3", description: "Dummy description", posterImageUrl: ""),
            .init(title: "Dummy Movie 4", description: "Dummy description", posterImageUrl: ""),
            .init(title: "Dummy Movie 5", description: "Dummy long long long long long description", posterImageUrl: ""),
            .init(title: "Dummy Movie 6", description: "Dummy description", posterImageUrl: ""),
            .init(title: "Dummy Movie 7", description: "Yet another dummy long long long long long description", posterImageUrl: ""),
            .init(title: "Dummy Movie 8", description: "Dummy description", posterImageUrl: ""),
            .init(title: "Dummy Movie 9", description: "Dummy description", posterImageUrl: ""),
            .init(title: "Dummy Movie 10", description: "Dummy description", posterImageUrl: ""),
        
        ]
    }
}
