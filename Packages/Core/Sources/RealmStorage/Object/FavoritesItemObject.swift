//
//  FavoritesItemObject.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import Core
import Foundation
import RealmSwift

public final class FavoritesItemObject: Object, Identifiable {
    @Persisted(primaryKey: true) public var id: UUID

    @Persisted public var urlString: String
}

extension FavoritesItem {
    public init(object: FavoritesItemObject) {
        self.init(
            id: object.id,
            resource: URL(string: object.urlString).map { .remote($0) } ?? .placeholder
        )
    }
}

extension FavoritesItemObject {
    public convenience init?(entity: FavoritesItem) {
        guard case let .remote(url) = entity.resource else { return nil }
        self.init()
        id = entity.id
        urlString = url.absoluteString
    }
}
