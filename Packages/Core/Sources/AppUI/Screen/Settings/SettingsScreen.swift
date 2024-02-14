//
//  SettingsScreen.swift
//
//
//  Created by Mikhail Apurin on 2024/02/14.
//

import Core
import SwiftUI

struct SettingsScreen: View {
    struct Actions {
        var showWelcome: () -> Void = emptyAction()
    }

    let actions: Actions

    @State private var isResetFavoritesDialogPresented = false

    @Environment(\.appActions.favorites) private var favorites

    var body: some View {
        List {
            Section("Favorites") {
                Button("Reset favorites", role: .destructive) {
                    isResetFavoritesDialogPresented = true
                }
                .confirmationDialog("Reset favorites?", isPresented: $isResetFavoritesDialogPresented) {
                    Button("Reset favorites", role: .destructive) {
                        favorites.reset()
                    }
                }
            }

            Section("SwiftUI MV Sample (Dogs)") {
                LabeledContent("Version", value: version)

                Button("Welcome screen") {
                    actions.showWelcome()
                }
            }
        }
        .listStyle(.insetGrouped)
    }

    var version: String {
        let bundle = Bundle.main
        let version = bundle.infoDictionary?["CFBundleVersion"] ?? "0"
        let shortVersion = bundle.infoDictionary?["CFBundleShortVersionString"] ?? "0"
        return "\(shortVersion) (\(version))"
    }
}

#Preview {
    SettingsScreen(actions: .init())
        .mockContainer(.app)
}
