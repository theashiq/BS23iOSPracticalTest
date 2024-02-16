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
    let originalTitle: String?  //original_title
    let posterPath: String?     //poster_path
    let overview: String?       //overview
    
    var posterUrl: String{
        "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")"
    }
}
