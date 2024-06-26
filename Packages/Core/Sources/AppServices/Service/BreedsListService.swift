//
//  BreedsListService.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import AppUI
import Core
import DogAPI
import RealmStorage
import RealmSwift
import Foundation

@MainActor public final class BreedsListService: Sendable {
    private let api: DogAPIClient
    
    private var lastRefresh = Date.distantPast

    private let realmConfiguration: Realm.Configuration

    private let errorAlert: AppState.ErrorAlert

    public init(api: DogAPIClient, realmConfiguration: Realm.Configuration, errorAlert: AppState.ErrorAlert) {
        self.api = api
        self.realmConfiguration = realmConfiguration
        self.errorAlert = errorAlert
    }
    
    public func refresh() async {
        guard Date.now.timeIntervalSince(lastRefresh) > 60 else { return } // Throttle reloads for 60s
        do {
            let breeds = try await api.execute(DogAPI.BreedListRequest.Get()).message
            try save(breeds: breeds.map())
            lastRefresh = .now
        } catch is CancellationError {
            // nothing
        } catch {
            errorAlert.alert = .init(underlying: error, message: "Could not refresh breeds list")
        }
    }

    func save(breeds: [BreedListItem]) throws {
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
