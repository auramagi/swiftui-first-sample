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
        public init() { }
    }
    
    public let configuration: Configuration
    
    public var app: AppDependency
    
    public init(configuration: Configuration) {
        self.configuration = configuration
        self.app = .init(
            state: .init(),
            actions: .init()
        )
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
