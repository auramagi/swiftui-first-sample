//
//  LiveAppContainer.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import AppServices
import AppUI
import SwiftUI

public final class LiveAppContainer: AppContainer {
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
