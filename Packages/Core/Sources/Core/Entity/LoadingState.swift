//
//  LoadingOperation.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Foundation

public struct LoadingState<Input: Sendable, Value>: Identifiable {
    public enum State {
        case inProgress
        
        case completed(Value)
        
        case error(any Error)
    }

    public let id = UUID()
    
    public let input: Input
    
    public var state = State.inProgress
    
    public init(input: Input) {
        self.input = input
    }
    
    public var didFinish: Bool {
        switch state {
        case .inProgress: false
        case .completed, .error: true
        }
    }

    public var value: Value? {
        if case let .completed(value) = state {
            value
        } else {
            nil
        }
    }
}
