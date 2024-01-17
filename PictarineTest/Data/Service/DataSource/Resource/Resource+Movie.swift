//
//  Resource+Movie.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import Foundation

extension Resource {

    static func movies(query: String) -> Resource<MoviesDTO> {
        let url = ApiConstants.baseUrl.appendingPathComponent("/search/movie")
        let parameters: [String : CustomStringConvertible] = [
            "api_key": ApiConstants.apiKey,
            "query": query,
            "language": Locale.preferredLanguages[0]
            ]
        return Resource<MoviesDTO>(url: url, parameters: parameters)
    }
}

