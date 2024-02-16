//
//  ContentView.swift
//  BS23iOSPracticalTest
//
//  Created by mac 2019 on 2/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            MovieListView(viewModel: MovieListViewModel(api: TMDB_APIService.shared))
                .listStyle(.plain)
                .navigationTitle("Movie List")
        }
    }
}

#Preview {
    ContentView()
}
