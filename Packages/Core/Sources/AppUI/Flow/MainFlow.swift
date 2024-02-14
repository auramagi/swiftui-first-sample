//
//  MainFlow.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

public struct MainFlow<Container: AppContainer>: View {
    let container: Container

    public init(container: Container) {
        self.container = container
    }

    public var body: some View {
        TabView {
            RandomImageFlow(container: container)
                .tabItem {
                    Label("Random", systemImage: "photo")
                }
            
            BreedListFlow(container: container)
                .tabItem {
                    Label("Breeds", systemImage: "dog")
                }

            FavoritesFlow(container: container)
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }

            SettingsFlow(container: container)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        MainFlow(container: container)
    }
}
