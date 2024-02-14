//
//  BreedsListService.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import DogAPI
import RealmStorage
import RealmSwift
import Foundation

public final class BreedsListService {
    private let api: DogAPIClient
    
    private var lastRefresh = Date.distantPast

    private var realmConfiguration: Realm.Configuration

    public init(api: DogAPIClient, realmConfiguration: Realm.Configuration) {
        self.api = api
        self.realmConfiguration = realmConfiguration
    }
    
    public func refresh() async {
        guard Date.now.timeIntervalSince(lastRefresh) > 60 else { return } // Throttle reloads for 60s
        do {
            let breeds = try await api.execute(DogAPI.BreedListRequest.Get()).message
            try await save(breeds: breeds.map())
            lastRefresh = .now
        } catch {
            print(error)
        }
    }

    @MainActor func save(breeds: [BreedListItem]) throws {
        let realm = try Realm(configuration: realmConfiguration)
        try realm.write {
            let list = realm.objects(BreedListObject.self).first ?? realm.create(BreedListObject.self)
            realm.delete(realm.objects(BreedListItemObject.self))
            list.breeds.append(
                objectsIn: breeds.map { BreedListItemObject(entity: $0) }
            )
        }
    }
}
