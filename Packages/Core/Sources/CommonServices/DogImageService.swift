//
//  DogImageService.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import DogAPI
import Foundation

public final class DogImageService {
    private let api: DogAPIClient
    
    public init(api: DogAPIClient) {
        self.api = api
    }
    
    public func getImage(_ image: DogImage) async throws -> URL {
        switch image {
        case .random:
            try await api.execute(DogAPI.RandomImageRequest.Single.Get()).message
            
        case let .breed(breed):
            try await getDogBreedImage(breed: breed)
        }
    }
    
    public func getDogBreedImage(breed: ConcreteBreed) async throws -> URL {
        if let subBreed = breed.subBreed {
            try await api.execute(DogAPI.SubBreedImageRequest.Random.Single.Get(breed: breed.breed, subBreed: subBreed)).message
        } else {
            try await api.execute(DogAPI.BreedImageRequest.Random.Single.Get(breed: breed.breed)).message
        }
    }
}
