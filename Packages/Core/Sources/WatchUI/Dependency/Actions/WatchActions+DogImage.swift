//
//  WatchActions+DogImage.swift
//
//
//  Created by Mikhail Apurin on 2024-02-14.
//

import Core
import Foundation

extension WatchActions {
    @MainActor public struct DogImage {
        public var getImage: (Core.DogImage) async throws -> DogImageResource = emptyAction(throwing: .message("Unimplemented"))

        nonisolated init() { }
    }
}
