//
//  WatchContainer.swift
//
//
//  Created by Mikhail Apurin on 2024-02-13.
//

import Core
import SwiftUI

public protocol WatchContainer: DependencyContainer {
    var watch: WatchDependency { get }
}

extension WatchContainer {
    public func inject(content: Content) -> some View {
        content
            .dependency(watch)
    }
}
