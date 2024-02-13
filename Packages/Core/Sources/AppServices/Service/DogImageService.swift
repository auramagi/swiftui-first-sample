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
            
        case let .breed(breed):
            try await getDogBreedImage(breed: breed)
        }
    }
    
    public func getDogBreedImage(breed: ConcreteBreed) async throws -> URL {
        if let subBreed = breed.subBreed {
            return try await api.execute(DogAPI.SubBreedImageRequest.Random.Single.Get(breed: breed.breed, subBreed: subBreed)).message
        } else {
            return try await api.execute(DogAPI.BreedImageRequest.Random.Single.Get(breed: breed.breed)).message
        }
    }
}