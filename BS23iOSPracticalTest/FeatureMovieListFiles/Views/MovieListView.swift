//
//  MovieListView.swift
//  BS23iOSPracticalTest
//
//  Created by mac 2019 on 2/16/24.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    var body: some View {
        List {
            ForEach(viewModel.movies) { listItem in
                MovieListItemView(viewModel: listItem)
            }
        }
        .onAppear{
            viewModel.fetchMovies()
        }
    }
}

#Preview {
    MovieListView(viewModel: MovieListViewModel())
}
