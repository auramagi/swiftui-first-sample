//
//  MockAppContainer.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

public final class MockAppContainer: MockDependencyContainer, AppContainer {

    public struct Configuration {
        var breeds: BreedList

        var defaultImage: DogImageResource?

        public init(
            breeds: BreedList = .mock,
            defaultImage: DogImageResource? = nil
        ) {
            self.breeds = breeds
            self.defaultImage = defaultImage
        }
    }
    
    public let configuration: Configuration
    
    public var app: AppDependency

    public init(configuration: Configuration) {
        self.configuration = configuration
        self.app = .init(
            state: .init(),
            actions: .init()
        )
        if let resource = configuration.defaultImage {
            app.actions.dogImage.getImage = { _ in
                try? await Task.sleep(for: .seconds(1))
                return resource
            }
        }
    }

    public func makeBreedListScreen() -> some View {
        MockBreedListScreen(state: configuration.breeds.map())
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
