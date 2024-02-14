//
//  SettingsScreen.swift
//
//
//  Created by Mikhail Apurin on 2024/02/14.
//

import Core
import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        List {
            Section("Favorites") {
                Button("Reset favorites", role: .destructive) {

                }
            }

            Section("SwiftUI MV Sample (Dogs)") {
                LabeledContent("Version", value: version)

                Button("Welcome screen") {

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
    SettingsScreen()
        .mockContainer(.app)
}
