//
//  DogImageService.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import AppUI
import Core
import Foundation

public final class DogImageService {
    private let api: DogAPIClient
    
    public init(api: DogAPIClient) {
        self.api = api
    }
    
    public func connect(_ actions: inout AppActions.DogImage) {
        actions.getImage = getImage(_:)
    }
    
    func getImage(_ image: DogImage) async throws -> URL {
        switch image {
        case .random:
            try await api.execute(DogAPI.RandomImageRequest.Single.Get()).message
        }
    }
}
