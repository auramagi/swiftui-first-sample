//
//  MockContainer.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import SwiftUI

public protocol MockDependencyContainer: DependencyContainer { }

public struct WithMockContainer<Container: MockDependencyContainer, Content: View>: View {
    private class Storage: ObservableObject {
        let container: Container

        init(container: Container) {
            self.container = container
        }
    }

    @StateObject private var storage: Storage

    private var content: (Container) -> Content

    public init(
        _ container: @autoclosure @escaping () -> Container,
        @ViewBuilder content: @escaping (Container) -> Content
    ) {
        self._storage = .init(wrappedValue: .init(container: container()))
        self.content = content
    }
    
    public var body: some View {
        content(storage.container)
            .dependency(storage.container)
    }
}

extension View {
    @MainActor public func mockContainer<Container: MockDependencyContainer>(
        _ container: @autoclosure @escaping () -> Container
    ) -> some View {
        WithMockContainer(container()) { _ in
            self
        }
    }
}
