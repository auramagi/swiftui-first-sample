//
//  AppActions.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

@MainActor public struct AppActions: ViewInjectable {
    struct Key: EnvironmentKey {
        static let defaultValue = AppActions()
    }
    
    public var breedList = BreedList()
    
    public var dogImage = DogImage()
    
    public var favorites = Favorites()

    nonisolated public init() { }
    
    public func inject(content: Content) -> some View {
        content
            .environment(\.appActions, self)
    }
}

extension EnvironmentValues {
    public var appActions: AppActions {
        get { self[AppActions.Key.self] }
        set { self[AppActions.Key.self] = newValue }
    }
}
