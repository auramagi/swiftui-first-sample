//
//  AppActions.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

public struct AppActions: ViewInjectable {
    struct Key: EnvironmentKey {
        static let defaultValue = AppActions()
    }
    
    public init() { }
    
    public func inject(content: Content) -> some View {
        content
    }
}

extension EnvironmentValues {
    public var appActions: AppActions {
        get { self[AppActions.Key.self] }
        set { self[AppActions.Key.self] = newValue }
    }
}
