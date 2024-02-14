//
//  WatchActions+DogImage.swift
//
//
//  Created by Mikhail Apurin on 2024-02-14.
//

import Core
import Foundation

extension WatchActions {
    public struct DogImage {
        public var getImage: (Core.DogImage) async throws -> URL = emptyAction(throwing: .message("Unimplemented"))
    }
}
