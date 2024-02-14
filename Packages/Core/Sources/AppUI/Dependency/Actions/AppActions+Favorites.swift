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
        public var favorite: (DogImageResource) throws -> Void = emptyAction()

        public var reset: () -> Void = emptyAction()
    }
}
