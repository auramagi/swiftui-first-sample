//
//  AppActions+Favorites.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import Core
import Foundation

extension AppActions {
    @MainActor public struct Favorites {
        public var connect: (FavoriteState, DogImageResource) -> Void = emptyAction()

        public var favorite: (DogImageResource) -> Void = emptyAction()

        public var reset: () -> Void = emptyAction()

        public var unfavorite: (DogImageResource) -> Void = emptyAction()

        nonisolated init() { }
    }
}
