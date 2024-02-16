//
//  MovieListViewModel.swift
//  BS23iOSPracticalTest
//
//  Created by mac 2019 on 2/16/24.
//

import Foundation

class MovieListViewModel: ObservableObject{
    @Published var movies: [MovieListItemViewModel] = []
    
    func fetchMovies(){
        Task{
            do{
                let fetchedMovies = try await TMDBAPIService.shared.fetch()
                DispatchQueue.main.async{
                    self.movies = fetchedMovies
                }
            }
        }
    }
    
}
