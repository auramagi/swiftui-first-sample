//
//  WatchDependency.swift
//
//
//  Created by Mikhail Apurin on 2024-02-13.
//

import Core
import SwiftUI

public struct WatchDependency: Dependency {
    public var state: WatchState
    
    public var actions: WatchActions
    
    public init(state: WatchState, actions: WatchActions) {
        self.state = state
        self.actions = actions
    }
}
