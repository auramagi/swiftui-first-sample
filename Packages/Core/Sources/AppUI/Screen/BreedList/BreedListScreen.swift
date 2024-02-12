//
//  BreedListScreen.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

struct BreedListScreen: View {
    @EnvironmentObject private var breedsState: AppState.BreedList
    
    @Environment(\.appActions.breedList) private var breeds

    var body: some View {
        List {
            Section {
                ForEach(breedsState.breeds, id: \.self) { item in
                    BreedListRow(item: item)
                }
            }
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
    BreedListScreen()
        .mockContainer(.app)
}
