//
//  ServiceProvider.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

// MARK: - ServicesProvider

/// A class that provides various services for the application.
class ServicesProvider {
    
    /// The main service used in the application (e.g., network service, local service).
    let service: ServiceType

    /// Creates a default network provider with a `NetworkService` and `ImageLoaderService`.
    static func defaultNetworkProvider() -> ServicesProvider {
        let service = APIService()
        return ServicesProvider(service: service)
    }
 

    /// Initializes the `ServicesProvider` with the specified services.
    init(service: ServiceType) {
        self.service = service
    }
}
