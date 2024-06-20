//
//  DogAPIClient.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import Foundation

public final class DogAPIClient: Sendable {
    public struct Configuration: Sendable {
        let baseURL: URL

        public init(baseURL: URL) {
            self.baseURL = baseURL
        }
    }

    let session: URLSession

    let configuration: Configuration

    public init(session: URLSession, configuration: Configuration) {
        self.session = session
        self.configuration = configuration
    }

    public func execute<Request: DogAPIRequest>(_ request: Request) async throws -> Request.Response {
        let (data, _) = try await session.data(for: request.makeURLRequest(configuration: configuration))
        return try request.decode(data: data)
    }
}

