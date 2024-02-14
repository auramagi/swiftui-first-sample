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
    public init?(object: FavoritesItemObject) {
        guard let url = URL(string: object.urlString) else { return nil }
        self.init(id: object.id, resource: .remote(url))
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
