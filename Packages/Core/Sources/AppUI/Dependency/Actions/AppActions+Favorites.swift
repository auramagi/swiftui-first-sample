//
//  AppActions+Favorites.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import Core
import Foundation

extension AppActions {
    public struct Favorites {
        public var connect: (FavoriteState, DogImageResource) -> Void = emptyAction()

        public var favorite: (DogImageResource) throws -> Void = emptyAction()

        public var reset: () throws -> Void = emptyAction()

        public var unfavorite: (DogImageResource) throws -> Void = emptyAction()
    }
}
