//
//  AppDependency.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

public struct AppDependency: Dependency {
    public var state: AppState
    
    public var actions: AppActions
    
    public init(state: AppState, actions: AppActions) {
        self.state = state
        self.actions = actions
    }
}
