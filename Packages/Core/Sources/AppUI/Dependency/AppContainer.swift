//
//  AppContainer.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

public protocol AppContainer: DependencyContainer {
    var app: AppDependency { get }

    associatedtype BreedListScreen: View
    func makeBreedListScreen() -> BreedListScreen
}

extension AppContainer {
    public func inject(content: Content) -> some View {
        content
            .dependency(app)
    }
}
