//
//  SearchMovies.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import SwiftUI

struct SearchMovies: View {
    
    @StateObject var viewModel = SearchMoviesViewModel()
    
    private var crossOverlay: some View {
        Button {
            viewModel.hasPresentedMovieDetail.toggle()
        } label: {
            XButton()
        }
    }
    
    var body: some View {
        ZStack {
            NavigationStack {
                content
                    .blur(radius: viewModel.hasPresentedMovieDetail ? 20 : 0)
                    .alert(viewModel.errorMessage ,
                           isPresented: $viewModel.hasError,
                           presenting: viewModel.errorMessage
                    ) { details in
                    } message: { details in
                        Text(details)
                    }
            }
            
            if viewModel.hasPresentedMovieDetail {
                if let movie = viewModel.selectedMovie {
                    MovieDetailsView(isPresentingCard: $viewModel.hasPresentedMovieDetail,
                                     movie: movie)
                        .overlay(crossOverlay, alignment: .topTrailing)
                }
            }

        }
        .onTapGesture {
            // Dismiss the keyboard when tapping outside of the TextField
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), 
                                            to: nil, from: nil, for: nil)
        }
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
                .listRowSeparator(.automatic)
                .onTapGesture {
                    viewModel.hasPresentedMovieDetail.toggle()
                    viewModel.selectedMovie = movie
                }
        }
        .listStyle(.plain)
        .disabled(viewModel.hasPresentedMovieDetail)
    }
}

#Preview {
    SearchMovies()
}
