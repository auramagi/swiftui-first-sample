//
//  FavoritesService.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import Core
import Foundation
import RealmStorage
import RealmSwift

final class FavoritesService {
    let realmConfiguration: Realm.Configuration

    init(realmConfiguration: Realm.Configuration) {
        self.realmConfiguration = realmConfiguration
    }

    func favorite(resource: DogImageResource) throws -> Void {
        guard let object = FavoritesItemObject(entity: .init(id: .init(), resource: resource)) else {
            throw .message("This image can't be favorited.")
        }
        let realm = try Realm(configuration: realmConfiguration)
        try realm.write {
            realm.add(object)
        }
    }

    func reset() throws -> Void {
        let realm = try Realm(configuration: realmConfiguration)
        try realm.write {
            realm.delete(realm.objects(FavoritesItemObject.self))
        }
    }
}
