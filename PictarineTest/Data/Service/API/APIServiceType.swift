//
//  APIServiceType.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import Foundation
import Combine

// MARK: - ApiServiceType

/// A protocol defining a network service for making network requests.
protocol APIServiceType: ServiceType {

    /// Loads data from a network resource and decodes it into the specified type.
    /// - Parameter resource: The network resource to load.
    /// - Returns: A publisher that emits the decoded type or an error.
    @discardableResult
    func load<T>(_ resource: Resource<T>) -> AnyPublisher<T, Error>
}

// MARK: - NetworkError

/// Defines the errors that can occur during network service operations.
enum APIError: Error {
    case invalidRequest
    case invalidResponse
    case dataLoadingError(statusCode: Int, data: Data)
    case jsonDecodingError(error: Error)
}
