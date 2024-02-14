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
        NavigationStack {
            FavoritesScreen(grid: container.makeFavoritesGrid())
                .navigationTitle("Favorites")
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        FavoritesFlow(container: container)
    }
}
