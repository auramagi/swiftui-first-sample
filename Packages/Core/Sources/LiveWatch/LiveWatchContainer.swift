//
//  LiveWatchContainer.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import SwiftUI
import WatchServices
import WatchUI

public final class LiveWatchContainer: WatchContainer {
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
