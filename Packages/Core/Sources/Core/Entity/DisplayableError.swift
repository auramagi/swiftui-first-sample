//
//  DisplayableError.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import Foundation

public struct DisplayableError: Identifiable, LocalizedError {
    public let id: UUID = .init()

    public let underlying: (any Error)?

    public let message: String

    public init(underlying: (any Error)? = nil, message: String) {
        self.underlying = underlying
        self.message = message
    }

    public var errorDescription: String? {
        message
    }
}
