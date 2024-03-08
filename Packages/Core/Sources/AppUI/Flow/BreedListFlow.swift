//
//  BreedListFlow.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

struct BreedListFlow<Container: AppContainer>: View {
    let container: Container
    
    var body: some View {
        _Content(flow: self)
            .dependency(container)
    }
}

private struct _Content<Container: AppContainer>: View {
    let flow: BreedListFlow<Container>

    var body: some View {
        NavigationStack {
            BreedListScreen(factory: flow.container.makeBreedListScreenFactory())
                .navigationTitle("Breeds")
                .navigationDestination(for: BreedListScreenDestination.self) { destination in
                    switch destination {
                    case let .breedImage(breed):
                        DogImageScreen(image: .breed(breed))
                            .navigationTitle(breed.formatted(.breedName))
                    }
                }
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        BreedListFlow(container: container)
    }
}
