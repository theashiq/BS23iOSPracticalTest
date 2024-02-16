//
//  MovieListItemView.swift
//  BS23iOSPracticalTest
//
//  Created by mac 2019 on 2/16/24.
//

import SwiftUI

struct MovieListItemView: View {
    let viewModel: MovieListItemViewModel
    
    var body: some View {
        HStack {
            
            imageView
            
            VStack(alignment: .leading){
                Text(viewModel.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(viewModel.description)
                    .font(.subheadline)
                Spacer()
            }
        }
    }
    
    private var imageView : some View {
        AsyncImage(url: URL(string: viewModel.posterImageUrl)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            Image(systemName: "popcorn")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(maxWidth: 60)
    }
}

#Preview {
    MovieListItemView(viewModel: MovieListItemViewModel(title: "Movie Title", description: "A description for the Movie", posterImageUrl: ""))
}
