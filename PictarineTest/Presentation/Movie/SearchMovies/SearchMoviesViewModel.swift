//
//  SearchMoviesViewModel.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import Foundation
import SwiftUI
import Combine

final class SearchMoviesViewModel: ObservableObject {
    
    var movieUseCase = SearchMoviesUseCase(repository: MoviesRepositoryImpl(apiService: ServicesProvider.defaultNetworkProvider().service as! APIServiceType))
    
    @Published var movies: [Movie] = []
    @Published var errorMessage = ""
    @Published var hasError = false
    @Published var search: String = "Test"
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $search
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .map { searchQuery in
                self.movieUseCase.searchMovies(with: searchQuery)
            }
            .switchToLatest()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] result in
                switch result {
                case .success(let movies):
                    self?.movies = movies
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.hasError = true
                }
            }
            .store(in: &cancellables)
    }
}
