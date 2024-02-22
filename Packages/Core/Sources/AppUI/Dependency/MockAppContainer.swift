//
//  MockAppContainer.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import PreviewAssets
import SwiftUI

public final class MockAppContainer: MockDependencyContainer, AppContainer {

    public struct Configuration {
        var breeds: BreedList

        var defaultImage: DogImageResource?

        var didShowWelcome: Bool

        var favorites: [FavoritesItem]

        public init(
            breeds: BreedList = .mock,
            defaultImage: DogImageResource? = nil,
            didShowWelcome: Bool = true,
            favorites: [FavoritesItem] = []
        ) {
            self.breeds = breeds
            self.defaultImage = defaultImage
            self.didShowWelcome = didShowWelcome
            self.favorites = favorites
        }
    }
    
    public let configuration: Configuration
    
    public var app: AppDependency

    let defaults: UserDefaults

    public init(configuration: Configuration) {
        self.configuration = configuration
        self.app = .init(
            state: .init(),
            actions: .init()
        )
        self.defaults = .mock()

        if let resource = configuration.defaultImage {
            app.actions.dogImage.getImage = { _ in
                try? await Task.sleep(for: .seconds(1))
                return resource
            }
        }
        
        defaults.set(configuration.didShowWelcome, forKey: SettingsKey.Welcome.didShow)
    }

    public func inject(content: Content) -> some View {
        content
            .dependency(app)
            .defaultAppStorage(defaults)
    }

    public func makeBreedListScreenFactory() -> some BreedListScreenFactory {
        MockBreedListScreenFactory(breeds: configuration.breeds.map())
    }

    public func makeFavoritesScreenFactory() -> some FavoritesScreenFactory {
        MockFavoritesScreenFactory(items: configuration.favorites)
    }
}

extension MockDependencyContainer where Self == MockAppContainer {
    public static func app(
        configuration: MockAppContainer.Configuration = .init(),
        configure: (Self) -> Void = { _ in }
    ) -> Self {
        let container = Self(configuration: configuration)
        configure(container)
        return container
    }
    
    public static var app: Self {
        .app(configuration: .init())
    }
}
