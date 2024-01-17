//
//  MockData.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import Foundation

struct MockData {
    static let sampleMovie: Movie = {
        return Movie(
            id: 1,
            title: "Sample Movie",
            overview: "This is a sample movie overview.",
            posterPath: "sample_poster.jpg",
            popularity: 22.34,
            voteAverage: 8.5,
            releaseDate: "2022-01-01"
        )
    }()

    static func generateMovies(count: Int) -> [Movie] {
        var movies = [Movie]()

        for i in 2...count + 1 {
            let movie = Movie(
                id: i,
                title: "Movie \(i)",
                overview: "Overview for Movie \(i)",
                posterPath: "poster\(i).jpg",
                popularity: Double(i) * 3.23,
                voteAverage: Double(i) * 0.5,
                releaseDate: "2022-01-0\(i)"
            )
            movies.append(movie)
        }

        return [sampleMovie] + movies
    }
}
