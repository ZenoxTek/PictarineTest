//
//  MovieDTO.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import Foundation

struct MovieDTO: Identifiable, Decodable{
    
    let id: Int
    let title: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    var posterURL: URL? {
        posterPath.map { URL(string: "https://image.tmdb.org/t/p/w400/\($0)")! }
    }
    let voteAverage: Double
    let releaseDate: String?
}
