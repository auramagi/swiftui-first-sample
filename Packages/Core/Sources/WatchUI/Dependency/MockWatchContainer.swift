//
//  MockWatchContainer.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-13.
//

import Core
import SwiftUI

public final class MockWatchContainer: MockDependencyContainer, WatchContainer {
    public struct Configuration {
        public init(
        ) {
        }
    }
    
    public let configuration: Configuration
    
    public var watch: WatchDependency
    
    public init(configuration: Configuration) {
        self.configuration = configuration
        self.watch = .init(
            state: .init(),
            actions: .init()
        )
    }
}

extension MockDependencyContainer where Self == MockWatchContainer {
    public static func watch(
        configuration: MockWatchContainer.Configuration = .init(),
        configure: (Self) -> Void = { _ in }
    ) -> Self {
        let container = Self(configuration: configuration)
        configure(container)
        return container
    }
    
    public static var watch: Self {
        .watch(configuration: .init())
    }
}
