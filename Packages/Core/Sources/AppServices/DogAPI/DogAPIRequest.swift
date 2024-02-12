//
//  DogAPIRequest.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Foundation

public protocol DogAPIRequest {
    associatedtype Message: Decodable

    typealias Response = DogAPIResponse<Message>

    var path: String { get }

    var method: String { get }

    func makeURLRequest(configuration: DogAPIClient.Configuration) -> URLRequest

    func decode(data: Data) throws -> Response
}

extension DogAPIRequest {
    public func makeURLRequest(configuration: DogAPIClient.Configuration) -> URLRequest {
        let url = configuration.baseURL.appending(path: path)
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }

    public func decode(data: Data) throws -> Response {
        try JSONDecoder().decode(Response.self, from: data)
    }
}
