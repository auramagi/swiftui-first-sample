//
//  WatchActions.swift
//
//
//  Created by Mikhail Apurin on 2024-02-13.
//

import Core
import SwiftUI

@MainActor public struct WatchActions: ViewInjectable {
    struct Key: EnvironmentKey {
        static let defaultValue = WatchActions()
    }
    
    public var dogImage = DogImage()
    
    nonisolated public init() { }

    public func inject(content: Content) -> some View {
        content
            .environment(\.watchActions, self)
    }
}

extension EnvironmentValues {
    public var watchActions: WatchActions {
        get { self[WatchActions.Key.self] }
        set { self[WatchActions.Key.self] = newValue }
    }
}
