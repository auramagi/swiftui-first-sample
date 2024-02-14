//
//  AppState.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

public struct AppState: ViewInjectable {    
    public init() { }
    
    public func inject(content: Content) -> some View {
        content
    }
}
