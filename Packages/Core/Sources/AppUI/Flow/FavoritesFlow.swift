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
        unavailable
    }

    @ViewBuilder var unavailable: some View {
        if #available(iOS 17.0, *) {
            ContentUnavailableView("No Favorites", systemImage: "star")
                .symbolVariant(.slash.fill)
        } else {
            VStack(spacing: 16) {
                Image(systemName: "star")
                    .imageScale(.large)
                    .foregroundStyle(.secondary)
                    .symbolVariant(.slash.fill)
                    .font(.largeTitle)

                Text("No Favorites")
                    .font(.title2.bold())
            }
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        FavoritesFlow(container: container)
    }
}
