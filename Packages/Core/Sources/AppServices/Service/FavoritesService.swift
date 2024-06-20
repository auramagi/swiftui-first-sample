//
//  FavoritesService.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import AppUI
import Combine
import Core
import Foundation
import RealmStorage
import RealmSwift

@MainActor public final class FavoritesService: Sendable {
    let realmConfiguration: Realm.Configuration

    let errorAlert: AppState.ErrorAlert

    public init(realmConfiguration: Realm.Configuration, errorState: AppState.ErrorAlert) {
        self.realmConfiguration = realmConfiguration
        self.errorAlert = errorState
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

    public func favorite(resource: DogImageResource) {
        do {
            guard let object = FavoritesItemObject(entity: .init(id: .init(), resource: resource)) else {
                throw .message("This image can't be favorited.")
            }
            let realm = try Realm(configuration: realmConfiguration)
            try realm.write {
                realm.add(object)
            }
        } catch {
            errorAlert.alert = .init(underlying: error, message: "Could not favorite")
        }
    }

    public func reset() -> Void {
        do {
            let realm = try Realm(configuration: realmConfiguration)
            try realm.write {
                realm.delete(realm.objects(FavoritesItemObject.self))
            }
        } catch {
            errorAlert.alert = .init(underlying: error, message: "Could not reset")
        }
    }

    public func unfavorite(resource: DogImageResource) {
        do {
            guard case let .remote(url) = resource else {
                throw .message("This image can't be favorited.")
            }
            let urlString = url.absoluteString
            let realm = try Realm(configuration: realmConfiguration)
            try realm.write {
                let objects = realm.objects(FavoritesItemObject.self).where { $0.urlString == urlString }
                realm.delete(objects)
            }
        } catch {
            errorAlert.alert = .init(underlying: error, message: "Could not unfavorite")
        }
    }
}
