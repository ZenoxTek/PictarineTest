//
//  Movie.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import Foundation

struct Movie: Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    var posterURL: URL? {
        posterPath.map { URL(string: "https://image.tmdb.org/t/p/w400/\($0)")! }
    }
    let popularity: Double
    let voteAverage: Double
    let releaseDate: String?
    
    func retrieveYearDate() -> String {
        guard let date = releaseDate else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: date) {
            let calendar = Calendar.current
            return "\(calendar.component(.year, from: date))"
        }
        return ""
    }
}

extension Movie: Equatable {
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Movie: Hashable {
   

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

