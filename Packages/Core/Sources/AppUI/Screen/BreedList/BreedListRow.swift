//
//  BreedListRow.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

struct BreedListRow: View {
    let item: BreedListItem

    @State private var isExpanded = true

    var body: some View {
        switch item {
        case let .group(breed, subBreeds):
            DisclosureGroup(isExpanded: $isExpanded) {
                ForEach(subBreeds, id: \.self) { subBreed in
                    NavigationLink(value: BreedListScreenDestination.breedImage(breed: subBreed)) {
                        Text(subBreed, format: .breedName)
                    }
                }
            } label: {
                NavigationLink(value: BreedListScreenDestination.breedImage(breed: breed)) {
                    Text(breed, format: .breedName)
                }
            }

        case let .concrete(breed):
            NavigationLink(value: BreedListScreenDestination.breedImage(breed: breed)) {
                Text(breed, format: .breedName)
            }
        }
    }
}

#Preview {
    List {
        BreedListRow(item: .concrete(.init(breed: "Shiba", subBreed: nil)))

        BreedListRow(item: .group(breed: .init(breed: "Poodle", subBreed: nil), subBreeds: [
            .init(breed: "Poodle", subBreed: "Toy")
        ]))
    }
}
