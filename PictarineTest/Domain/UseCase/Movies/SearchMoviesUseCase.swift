//
//  SearchMoviesUseCase.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import Foundation
import Combine

protocol SearchMoviesUseCaseType {
    
    func searchMovies(with query: String) -> AnyPublisher<Result<[Movie], Error>, Never>
}

struct SearchMoviesUseCase: SearchMoviesUseCaseType {
    
    var repository: MoviesRepository
    
    func searchMovies(with query: String) -> AnyPublisher<Result<[Movie], Error>, Never> {
        repository.searchMovies(with: query)
    }
}
