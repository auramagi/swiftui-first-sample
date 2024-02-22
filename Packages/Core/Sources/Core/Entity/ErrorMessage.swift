//
//  ErrorMessage.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Foundation

public struct ErrorMessage: LocalizedError {
    public let message: String

    public init(message: String) {
        self.message = message
    }

    public var errorDescription: String? {
        message
    }
}

public extension Error where Self == ErrorMessage {
    static func message(_ message: String) -> Self {
        .init(message: message)
    }
}
