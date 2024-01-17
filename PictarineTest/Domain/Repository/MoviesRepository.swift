//
//  MoviesRepository.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import Foundation
import Combine

protocol MoviesRepository {
    
    func searchMovies(with query: String) -> AnyPublisher<Result<[Movie], Error>, Never>
    
    func getInfoMovie(of id: Int) -> AnyPublisher<Result<Movie, Error>, Never>
}
