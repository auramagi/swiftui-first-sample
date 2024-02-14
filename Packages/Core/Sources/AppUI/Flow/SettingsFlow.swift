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

    @State private var isShowingWelcome = false

    var body: some View {
        NavigationStack {
            SettingsScreen(actions: .init(
                showWelcome: { isShowingWelcome = true }
            ))
            .dependency(container)
            .navigationTitle("Settings")
        }
        .sheet(isPresented: $isShowingWelcome) {
            WelcomeScreen(actions: .init(
                dismiss: { isShowingWelcome = false }
            ))
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        SettingsFlow(container: container)
    }
}
