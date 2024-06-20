//
//  SettingsScreen.swift
//
//
//  Created by Mikhail Apurin on 2024/02/14.
//

import Core
import SwiftUI

struct SettingsScreen: View {
    struct Flow {
        var showWelcome: () -> Void = emptyAction()
    }

    let flow: Flow

    @State private var isResetFavoritesDialogPresented = false

    @Environment(\.appActions) private var actions

    var body: some View {
        List {
            Section("Favorites") {
                Button("Reset favorites", role: .destructive) {
                    isResetFavoritesDialogPresented = true
                }
                .confirmationDialog("Reset favorites?", isPresented: $isResetFavoritesDialogPresented) {
                    Button("Reset favorites", role: .destructive) {
                        actions.favorites.reset()
                    }
                }
            }

            Section("SwiftUI MV Sample (Dogs)") {
                LabeledContent("Version", value: version)

                Button("Welcome screen") {
                    flow.showWelcome()
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
    SettingsScreen(flow: .init())
        .mockContainer(.app)
}
