//
//  BreedListScreen.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

struct MockBreedListScreen: View {
    let state: [BreedListItem]

    init(state: [BreedListItem]) {
        self.state = state
    }

    var body: some View {
        List {
            Section {
                ForEach(state, id: \.self) { item in
                    BreedListRow(item: item)
                }
            }
        }
    }
}

struct MockBreedListScreenServiceModifier: ViewModifier {
    @Environment(\.appActions.breedList) private var breeds

    func body(content: Content) -> some View {
        content
            .task {
                await breeds.refresh()
            }
            .refreshable {
                await breeds.refresh()
            }
    }
}

enum BreedListScreenDestination: Hashable {
    case breedImage(breed: ConcreteBreed)
}

#Preview {
    WithMockContainer(.app) { container in
        container.makeBreedListScreen()
            .modifier(MockBreedListScreenServiceModifier())
    }
}
