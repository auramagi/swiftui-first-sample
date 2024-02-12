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
        
        public init(
            breeds: BreedList = .mock
        ) {
            self.breeds = breeds
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
        app.state.breedList.breeds = configuration.breeds.map()
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
