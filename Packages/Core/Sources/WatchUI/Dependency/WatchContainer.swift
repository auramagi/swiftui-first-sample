//
//  WatchContainer.swift
//
//
//  Created by Mikhail Apurin on 2024-02-13.
//

import Core
import SwiftUI

@MainActor public protocol WatchContainer: DependencyContainer {
    var watch: WatchDependency { get }
}

extension WatchContainer {
    public func inject(content: Content) -> some View {
        content
            .dependency(watch)
    }

    public var watch: some View {
        MainFlow(container: self)
    }
}
