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
        _Content(flow: self)
            .dependency(container)
    }
}

private struct _Content<Container: AppContainer>: View {
    let flow: FavoritesFlow<Container>

    var body: some View {
        NavigationStack {
            FavoritesScreen(factory: flow.container.makeFavoritesScreenFactory())
                .navigationTitle("Favorites")
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        FavoritesFlow(container: container)
    }
}
