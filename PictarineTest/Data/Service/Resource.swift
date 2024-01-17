//
//  Resource.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import Foundation

// MARK: - Resource

/// A data structure representing a network resource, including URL, parameters, and a URLRequest.
struct Resource<T: Decodable> {
    let url: URL
    let parameters: [String: CustomStringConvertible]
    let headers: [String: String]?
    
    /// Generates a URLRequest with the specified URL and parameters.
    var request: URLRequest? {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        components.queryItems = parameters.keys.map { key in
            URLQueryItem(name: key, value: parameters[key]?.description)
        }
        guard let url = components.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // Adjust the HTTP method as needed

        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }

    /// Initializes a new network resource with a URL and optional parameters.
    init(url: URL, parameters: [String: CustomStringConvertible] = [:], headers: [String: String]? = nil) {
        self.url = url
        self.parameters = parameters
        self.headers = headers
    }
}
