//
//  MainFlow.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

struct MainFlow<Container: AppContainer>: View {
    let container: Container

    var body: some View {
        _Content(flow: self)
            .dependency(container)
    }
}

private struct _Content<Container: AppContainer>: View {
    let flow: MainFlow<Container>

    @AppStorage(SettingsKey.Welcome.didShow) private var didShowWelcome = false

    var body: some View {
        ZStack {
            if didShowWelcome {
                TabView {
                    RandomImageFlow(container: flow.container)
                        .tabItem {
                            Label("Random", systemImage: "photo")
                        }

                    BreedListFlow(container: flow.container)
                        .tabItem {
                            Label("Breeds", systemImage: "dog")
                        }

                    FavoritesFlow(container: flow.container)
                        .tabItem {
                            Label("Favorites", systemImage: "star")
                        }

                    SettingsFlow(container: flow.container)
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
        .withErrorAlertService()
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

#Preview("Error") {
    WithMockContainer(.app {
        $0.app.state.errorAlert.alert = .init(message: "This is an error")
    }) { container in
        MainFlow(container: container)
    }
}
