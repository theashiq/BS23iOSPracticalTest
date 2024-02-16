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
            if #available(iOS 17.0, *) {
                if viewModel.showEmptyView {
                    ContentUnavailableView.search(text: viewModel.searchKeyword)
                }
            }
            else{
                if viewModel.showEmptyView {
                    Text("No Results for \(viewModel.searchKeyword)")
                        .font(.title)
                }
            } 
        }
    }
}

#Preview {
    MovieListView(viewModel: MovieListViewModel())
}
