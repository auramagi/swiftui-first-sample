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
        configuration: MockAppContainer.Configuration
    ) -> Self {
        .init(configuration: configuration)
    }
    
    public static var app: Self {
        .app(configuration: .init())
    }
}
