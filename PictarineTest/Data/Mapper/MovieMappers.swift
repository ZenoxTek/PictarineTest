//
//  MovieDTO.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import Foundation

extension MovieDTO {
    
    func toMovie() -> Movie {
        return Movie(id: self.id,
                     title: self.title,
                     overview: self.overview,
                     posterPath: self.posterPath,
                     popularity: self.popularity,
                     voteAverage: self.voteAverage,
                     releaseDate: self.releaseDate)
    }
}
