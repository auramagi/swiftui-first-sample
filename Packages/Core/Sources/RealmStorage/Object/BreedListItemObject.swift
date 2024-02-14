//
//  BreedListItemObject.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-14.
//

import Core
import Foundation
import RealmSwift

public final class BreedListItemObject: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) public var id: String

    @Persisted public var breed: String

    @Persisted public var subBreed: String?

    @Persisted public var subBreeds: List<BreedListItemObject>
}

extension BreedListItemObject {
    static func primaryKey(entity: ConcreteBreed) -> String {
        "\(entity.breed);\(entity.subBreed ?? "")"
    }
}

extension BreedListItem {
    public init(object: BreedListItemObject) {
        if object.subBreeds.isEmpty {
            self = .concrete(object.concreteBreed)
        } else {
            self = .group(breed: object.concreteBreed, subBreeds: object.subBreeds.map(\.concreteBreed))
        }
    }
}

extension BreedListItemObject {
    public convenience init(entity: BreedListItem) {
        self.init(entity: entity.concreteBreed)

        switch entity {
        case let .group(_, subBreeds):
            self.subBreeds = .init()
            self.subBreeds.append(objectsIn: subBreeds.map { .init(entity: $0) })

        case .concrete:
            self.subBreeds = .init()
        }
    }

    public convenience init(entity: ConcreteBreed) {
        self.init()
        self.id = BreedListItemObject.primaryKey(entity: entity)
        self.breed = entity.breed
        self.subBreed = entity.subBreed
    }

    public var concreteBreed: ConcreteBreed {
        .init(breed: breed, subBreed: subBreed)
    }
}
