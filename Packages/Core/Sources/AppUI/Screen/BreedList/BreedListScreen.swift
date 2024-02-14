//
//  BreedListScreen.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

struct BreedListScreen<BreedList: View>: View {
    let list: BreedList

    @Environment(\.appActions.breedList) private var breeds

    var body: some View {
        list
            .task {
                await breeds.refresh()
            }
            .refreshable {
                await breeds.refresh()
            }
    }
}

struct MockBreedListView: View {
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

enum BreedListScreenDestination: Hashable {
    case breedImage(breed: ConcreteBreed)
}

#Preview {
    WithMockContainer(.app) { container in
        BreedListScreen(list: container.makeBreedListView())
    }
}
