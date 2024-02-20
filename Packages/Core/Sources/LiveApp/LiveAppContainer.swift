//
//  LiveAppContainer.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import AppServices
import AppUI
import CommonServices
import DogAPI
import RealmSwift
import SwiftUI

public final class LiveAppContainer: AppContainer {
    public struct Configuration {
        let apiBaseURL: URL

        let realm = Realm.Configuration.defaultConfiguration

        public init(
            apiBaseURL: URL
        ) {
            self.apiBaseURL = apiBaseURL
        }
    }
    
    public let configuration: Configuration
    
    public var app: AppDependency
    
    let api: DogAPIClient
    
    let breedListService: BreedsListService
    
    let dogImageService: DogImageService

    let favoritesService: FavoritesService

    public init(configuration: Configuration) {
        self.configuration = configuration
        self.app = .init(
            state: .init(),
            actions: .init()
        )
        self.api = .init(
            session: .shared,
            configuration: .init(baseURL: configuration.apiBaseURL)
        )
        self.breedListService = .init(api: api, realmConfiguration: configuration.realm, errorAlert: app.state.errorAlert)
        self.dogImageService = .init(api: api)
        self.favoritesService = .init(realmConfiguration: configuration.realm, errorState: app.state.errorAlert)

        app.actions.breedList.refresh = breedListService.refresh
        app.actions.dogImage.getImage = dogImageService.getImage(_:)
        app.actions.favorites.connect = favoritesService.connect(state:resource:)
        app.actions.favorites.favorite = favoritesService.favorite(resource:)
        app.actions.favorites.reset = favoritesService.reset
        app.actions.favorites.unfavorite = favoritesService.unfavorite(resource:)
    }

    public func makeBreedListScreenFactory() -> some BreedListScreenFactory {
        RealmBreedListScreenFactory(realmConfiguration: configuration.realm)
    }

    public func makeFavoritesScreenFactory() -> some FavoritesScreenFactory {
        RealmFavoritesScreenFactory(realmConfiguration: configuration.realm)
    }
}
