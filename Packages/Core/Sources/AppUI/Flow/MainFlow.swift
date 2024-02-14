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

    @AppStorage(SettingsKey.Welcome.didShow) private var didShowWelcome = false

    public init(container: Container) {
        self.container = container
    }

    public var body: some View {
        ZStack {
            if didShowWelcome {
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
            } else {
                WelcomeScreen(actions: .init(
                    dismiss: { didShowWelcome = true }
                ))
            }
        }
        .animation(.default, value: didShowWelcome)
    }
}

#Preview {
    WithMockContainer(.app) { container in
        MainFlow(container: container)
    }
}

#Preview("Welcome") {
    WithMockContainer(.app(configuration: .init(didShowWelcome: false))) { container in
        MainFlow(container: container)
    }
}
