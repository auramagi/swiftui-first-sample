//
//  FavoritesItem.swift
//  
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import Foundation

public struct FavoritesItem: Identifiable {
    public let id: UUID

    public let resource: DogImageResource

    public init(id: UUID, resource: DogImageResource) {
        self.id = id
        self.resource = resource
    }
}
