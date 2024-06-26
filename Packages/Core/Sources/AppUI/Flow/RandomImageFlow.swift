//
//  RandomImageFlow.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

struct RandomImageFlow<Container: AppContainer>: View {
    let container: Container

    var body: some View {
        Content(flow: self)
            .dependency(container)
    }
}

extension RandomImageFlow {
    private struct Content: View {
        let flow: RandomImageFlow

        var body: some View {
            NavigationStack {
                DogImageScreen(image: .random)
                    .navigationTitle("Random Dog")
            }
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        RandomImageFlow(container: container)
    }
}
