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
            viewModel.fetchDefaultMovies()
        }
        .searchable(text: $viewModel.searchKeyword)
        .overlay{
            if viewModel.showEmptyView {
                ContentUnavailableView.search(text: viewModel.searchKeyword)
            }
            else if viewModel.showSearchHint{
                ContentUnavailableView.init("Enter Movie Titles", systemImage: "magnifyingglass", description: Text("Enter movie title in the search field"))
            }
        }
    }
}

#Preview {
    MovieListView(viewModel: MovieListViewModel())
}
