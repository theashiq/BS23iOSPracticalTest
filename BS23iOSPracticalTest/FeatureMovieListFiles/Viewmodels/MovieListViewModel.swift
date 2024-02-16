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
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.movies = MovieListItemViewModel.dummies
        }
    }
    
}
