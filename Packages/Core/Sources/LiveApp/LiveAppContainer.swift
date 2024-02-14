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
import SwiftUI

public final class LiveAppContainer: AppContainer {
    public struct Configuration {
        let apiBaseURL: URL
        
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
        self.breedListService = .init(api: api, realmConfiguration: .defaultConfiguration, errorAlert: app.state.errorAlert)
        self.dogImageService = .init(api: api)
        self.favoritesService = .init(realmConfiguration: .defaultConfiguration, errorState: app.state.errorAlert)

        app.actions.breedList.refresh = breedListService.refresh
        app.actions.dogImage.getImage = dogImageService.getImage(_:)
        app.actions.favorites.connect = favoritesService.connect(state:resource:)
        app.actions.favorites.favorite = favoritesService.favorite(resource:)
        app.actions.favorites.reset = favoritesService.reset
        app.actions.favorites.unfavorite = favoritesService.unfavorite(resource:)
    }

    public func makeBreedListView() -> some View {
        RealmBreedListView()
    }

    public func makeFavoritesGrid() -> some View {
        RealmFavoritesGridView()
    }
}
