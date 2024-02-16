//
//  MovieListViewModel.swift
//  BS23iOSPracticalTest
//
//  Created by mac 2019 on 2/16/24.
//

import Foundation

class MovieListViewModel: ObservableObject{
    @Published var movies: [MovieListItemViewModel] = []
    
    @Published var searchKeyword: String = ""{
        didSet{
            if searchKeyword.count > 2{
                search()
            }
        }
    }
    
    var showEmptyView : Bool {
        movies.isEmpty && !searchKeyword.isEmpty
    }
    
    private var searchWork: DispatchWorkItem?
    
    func fetchDefaultMovies(){
        Task{
            do{
                let fetchedMovies = try await TMDBAPIService.shared.fetchDefaultMovies()
                DispatchQueue.main.async{
                    self.movies = fetchedMovies
                }
            }
        }
    }
    
    private func search(){
        
        guard searchKeyword.count >= 3 else{
            return
        }
        
        searchWork?.cancel()
        searchWork = DispatchWorkItem {
            Task{
                do{
                    let fetchedMovies = try await TMDBAPIService.shared.search(with: self.searchKeyword)
                    print(fetchedMovies.map(\.title))
                    DispatchQueue.main.async{
                        self.movies = fetchedMovies
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
            }
        }
        if let searchWork{
            DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 1, execute: searchWork)
        }
    }
    
    
}
