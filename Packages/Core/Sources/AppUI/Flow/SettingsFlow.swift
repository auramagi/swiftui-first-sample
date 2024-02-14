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
        NavigationStack {
            SettingsScreen()
                .dependency(container)
                .navigationTitle("Settings")
        }

    }
}

#Preview {
    WithMockContainer(.app) { container in
        SettingsFlow(container: container)
    }
}
