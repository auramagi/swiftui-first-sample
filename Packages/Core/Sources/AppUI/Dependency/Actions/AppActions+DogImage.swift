//
//  AppActions+DogImage.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import Foundation

extension AppActions {
    public struct DogImage {
        public var getImage: (Core.DogImage) async throws -> DogImageResource = emptyAction(throwing: .message("Unimplemented"))
    }
}
