//
//  SettingsFlow.swift
//
//
//  Created by Mikhail Apurin on 2024/02/14.
//

import Core
import SwiftUI

struct SettingsFlow<Container: AppContainer>: View {
    let container: Container

    var body: some View {
        Content(flow: self)
            .dependency(container)
    }
}

extension SettingsFlow {
    private struct Content: View {
        let flow: SettingsFlow

        @State private var isShowingWelcome = false

        var body: some View {
            NavigationStack {
                SettingsScreen(flow: .init(
                    showWelcome: { isShowingWelcome = true }
                ))
                .navigationTitle("Settings")
            }
            .sheet(isPresented: $isShowingWelcome) {
                WelcomeScreen(flow: .init(
                    dismiss: { isShowingWelcome = false }
                ))
            }
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        SettingsFlow(container: container)
    }
}
