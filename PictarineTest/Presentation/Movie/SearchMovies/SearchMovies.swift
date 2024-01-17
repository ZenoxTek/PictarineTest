//
//  SearchMovies.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import SwiftUI

struct SearchMovies: View {
    
    @StateObject var viewModel = SearchMoviesViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                content
            }
        }
        .background(.white)
    }
    
    @ViewBuilder private var content: some View {
        Group {
            if viewModel.hasError {
                errorView()
            } else {
                loadedView()
                    .searchable(text: $viewModel.search)
            }
        }
        .navigationTitle("Searched Movies 🎥")
    }
    
    private func errorView() -> some View {
        Label(
            title: { Text(viewModel.errorMessage) },
            icon: { Image(systemName: "exclamationmark.triangle.fill") }
        )
    }
    
    private func loadedView() -> some View {
        List(viewModel.movies) { movie in
            MovieCell(movie: movie)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    SearchMovies()
}
