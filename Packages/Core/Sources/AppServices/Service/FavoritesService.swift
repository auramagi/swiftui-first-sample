//
//  FavoritesService.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import Combine
import Core
import Foundation
import RealmStorage
import RealmSwift

public final class FavoritesService {
    let realmConfiguration: Realm.Configuration

    public init(realmConfiguration: Realm.Configuration) {
        self.realmConfiguration = realmConfiguration
    }

    public func connect(state: FavoriteState, resource: DogImageResource) {
        do {
            guard case let .remote(url) = resource else {
                state.canFavorite = false
                return
            }
            state.canFavorite = true
            let urlString = url.absoluteString
            let realm = try Realm(configuration: realmConfiguration)
            realm.objects(FavoritesItemObject.self)
                .where { $0.urlString == urlString }
                .collectionPublisher
                .map { !$0.isEmpty }
                .replaceError(with: false)
                .assign(to: &state.$isFavorited)
        } catch {
            print(error)
        }
    }

    public func favorite(resource: DogImageResource) throws {
        guard let object = FavoritesItemObject(entity: .init(id: .init(), resource: resource)) else {
            throw .message("This image can't be favorited.")
        }
        let realm = try Realm(configuration: realmConfiguration)
        try realm.write {
            realm.add(object)
        }
    }

    public func reset() throws -> Void {
        let realm = try Realm(configuration: realmConfiguration)
        try realm.write {
            realm.delete(realm.objects(FavoritesItemObject.self))
        }
    }

    public func unfavorite(resource: DogImageResource) throws {
        guard case let .remote(url) = resource else {
            throw .message("This image can't be favorited.")
        }
        let urlString = url.absoluteString
        let realm = try Realm(configuration: realmConfiguration)
        try realm.write {
            let objects = realm.objects(FavoritesItemObject.self).where { $0.urlString == urlString }
            realm.delete(objects)
        }
    }
}
