//
//  WelcomeScreen.swift
//
//
//  Created by Mikhail Apurin on 2024/02/14.
//

import Core
import SwiftUI

struct WelcomeScreen: View {
    struct Actions {
        var dismiss: () -> Void
    }

    let actions: Actions

    var body: some View {
        VStack(spacing: 64) {
            Text("Welcome")
                .font(.largeTitle.bold())

            Text("Thank you for installing this app!")

            Button("Show me dogs") {
                actions.dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
