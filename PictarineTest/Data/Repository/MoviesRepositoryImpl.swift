//
//  MoviesRepositoryImpl.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import Foundation
import Combine

struct MoviesRepositoryImpl: MoviesRepository {
    
    var apiService: APIServiceType
    
    func searchMovies(with query: String) -> AnyPublisher<Result<[Movie], Error>, Never> {
        return apiService
            .load(Resource<MoviesDTO>.movies(query: query))
            .map({ data in
                return .success(data.items.map { $0.toMovie() })
            })
            .catch { error -> AnyPublisher<Result<[Movie], Error>, Never> in .just(.failure(error)) }
            .subscribe(on: Scheduler.backgroundWorkScheduler)
            .receive(on: Scheduler.mainScheduler)
            .eraseToAnyPublisher()
    }
    
    func getInfoMovie(of id: Int) -> AnyPublisher<Result<Movie, Error>, Never> {
        return .empty()
    }
}
