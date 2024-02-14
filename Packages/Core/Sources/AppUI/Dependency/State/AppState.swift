//
//  AppState.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

public struct AppState: ViewInjectable {
    public var errorAlert = ErrorAlert()

    public init() { }
    
    public func inject(content: Content) -> some View {
        content
            .environmentObject(errorAlert)
    }
}
