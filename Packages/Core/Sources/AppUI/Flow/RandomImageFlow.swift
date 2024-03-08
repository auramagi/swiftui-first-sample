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
        _Content(flow: self)
            .dependency(container)
    }
}

private struct _Content<Container: AppContainer>: View {
    let flow: RandomImageFlow<Container>

    var body: some View {
        NavigationStack {
            DogImageScreen(image: .random)
                .navigationTitle("Random Dog")
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        RandomImageFlow(container: container)
    }
}
