//
//  APIService.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import Foundation
import Combine

// MARK: - APIService

/// A concrete implementation of `NetworkServiceType` for making network requests.
final class APIService: APIServiceType {
    private let session: URLSession

    init(session: URLSession = URLSession(configuration: URLSessionConfiguration.ephemeral)) {
        self.session = session
    }

    /// Loads data from a network resource and decodes it into the specified type.
    /// - Parameter resource: The network resource to load.
    /// - Returns: A publisher that emits the decoded type or an error.
    @discardableResult
    func load<T>(_ resource: Resource<T>) -> AnyPublisher<T, Error> {
        guard let request = resource.request else {
            return .fail(APIError.invalidRequest)
        }
        return session.dataTaskPublisher(for: request)
            .mapError { _ in APIError.invalidRequest }
            .print()
            .flatMap { data, response -> AnyPublisher<Data, Error> in
                guard let httpResponse = response as? HTTPURLResponse else {
                    return .fail(APIError.invalidResponse)
                }

                guard 200..<300 ~= httpResponse.statusCode else {
                    return .fail(APIError.dataLoadingError(statusCode: httpResponse.statusCode, data: data))
                }
                return .just(data)
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
