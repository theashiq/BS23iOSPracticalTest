//
//  TMDBModels.swift
//  BS23iOSPracticalTest
//
//  Created by mac 2019 on 2/16/24.
//

import Foundation

struct TMDBResponse: Decodable {
    let results: [TMDBMovie]
}

struct TMDBMovie: Decodable{
    let title: String?
    let posterPath: String?
    let overview: String?
    
    var posterUrl: String{
        "\(Constants.TMDBPosterBaseUrl)\(posterPath ?? "")"
    }
}
