//
//  FavoritesFlow.swift
//
//
//  Created by Mikhail Apurin on 2024/02/14.
//

import Core
import SwiftUI

struct FavoritesFlow<Container: AppContainer>: View {
    let container: Container

    var body: some View {
        Content(flow: self)
            .dependency(container)
    }
}

extension FavoritesFlow {
    private struct Content: View {
        let flow: FavoritesFlow

        var body: some View {
            NavigationStack {
                FavoritesScreen(factory: flow.container.makeFavoritesScreenFactory())
                    .navigationTitle("Favorites")
            }
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        FavoritesFlow(container: container)
    }
}
