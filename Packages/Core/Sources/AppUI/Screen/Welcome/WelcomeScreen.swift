//
//  WelcomeScreen.swift
//
//
//  Created by Mikhail Apurin on 2024/02/14.
//

import Core
import SwiftUI

struct WelcomeScreen: View {
    struct Flow {
        var dismiss: () -> Void = emptyAction()
    }

    let flow: Flow

    var body: some View {
        VStack(spacing: 64) {
            Text("Welcome")
                .font(.largeTitle.bold())

            Text("Thank you for installing this app!")

            Button("Show me dogs") {
                flow.dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    WelcomeScreen(flow: .init())
        .mockContainer(.app)
}
