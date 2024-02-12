//
//  EmptyAction.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import OSLog
import Foundation

private let log = Logger(subsystem: "me.apurin.actions", category: "Empty Action")

/// Empty action to be used as a default when initializing closures. When called outputs a reminder to set a proper closure.
public func emptyAction<each Input>(file: StaticString = #fileID, line: UInt = #line) -> (repeat each Input) -> Void {
    { (_: repeat each Input) -> Void in
        log.info("Executing empty action (defined in \(file):\(line))")
    }
}

/// Empty action to be used as a default when initializing closures. When called outputs a reminder to set a proper closure and returns `nil`.
public func emptyAction<each Input, Output>(file: StaticString = #fileID, line: UInt = #line) -> (repeat each Input) -> Output? {
    { (_: repeat each Input) -> Output? in
        log.info("Executing empty action (defined in \(file):\(line))")
        return nil
    }
}

/// Empty action to be used as a default when initializing closures. When called outputs a reminder to set a proper value and returns the provided value.
public func emptyAction<each Input, Output>(returning defaultValue: @autoclosure @escaping () -> Output, file: StaticString = #fileID, line: UInt = #line) -> (repeat each Input) -> Output {
    { (_: repeat each Input) -> Output in
        log.info("Executing empty action (defined in \(file):\(line))")
        return defaultValue()
    }
}

/// Empty action to be used as a default when initializing closures. When called outputs a reminder to set a proper closure and throws the provided error.
public func emptyAction<each Input, Output>(throwing error: @autoclosure @escaping () -> Error, file: StaticString = #fileID, line: UInt = #line) -> (repeat each Input) throws -> Output {
    { (_: repeat each Input) throws -> Output in
        log.info("Executing empty action (defined in \(file):\(line))")
        throw error()
    }
}
