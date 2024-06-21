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
        Content(flow: self)
            .dependency(container)
    }
}

extension BreedListFlow {
    private struct Content: View {
        let flow: BreedListFlow

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
}

#Preview {
    WithMockContainer(.app) { container in
        BreedListFlow(container: container)
    }
}
