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
        _Content(flow: self)
            .dependency(container)
    }
}

private struct _Content<Container: AppContainer>: View {
    let flow: SettingsFlow<Container>

    @State private var isShowingWelcome = false

    var body: some View {
        NavigationStack {
            SettingsScreen(actions: .init(
                showWelcome: { isShowingWelcome = true }
            ))
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
