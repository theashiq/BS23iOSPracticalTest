//
//  APIService.swift
//  BS23iOSPracticalTest
//
//  Created by mac 2019 on 2/16/24.
//

import Foundation

protocol APIService{
    func fetchDefaultMovies() async throws -> [MovieListItemViewModel]
    func search(with key: String) async throws -> [MovieListItemViewModel]
}
