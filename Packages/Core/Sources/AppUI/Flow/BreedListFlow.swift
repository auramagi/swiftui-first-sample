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
        NavigationStack {
            BreedListScreen(list: container.makeBreedListView())
                .dependency(container)
                .navigationTitle("Breeds")
                .navigationDestination(for: BreedListScreenDestination.self) { destination in
                    switch destination {
                    case let .breedImage(breed):
                        DogImageScreen(image: .breed(breed))
                            .navigationTitle(breed.formatted(.breedName))
                            .dependency(container)
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
