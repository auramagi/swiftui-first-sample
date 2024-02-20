//
//  BreedListScreen.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import CommonUI
import SwiftUI

struct BreedListScreen<Factory: BreedListScreenFactory>: View {
    let factory: Factory

    @Environment(\.appActions.breedList) private var breeds

    var body: some View {
        WithProperty(factory.makeScreenData()) { screenData in
            List {
                if let breeds = screenData.breeds {
                    ForEach(breeds) { breed in
                        BreedListRow(item: screenData.breed(breed))
                    }
                }
            }
            .task {
                await breeds.refresh()
            }
            .refreshable {
                await breeds.refresh()
            }
        }
        .dependency(factory)
    }
}

// MARK: Factory

public protocol BreedListScreenFactory: ViewInjectable {
    associatedtype ScreenData: BreedListScreenData
    func makeScreenData() -> ScreenData
}

public protocol BreedListScreenData: DynamicProperty {
    typealias Breed = Breeds.Element

    associatedtype Breeds: RandomAccessCollection where Breed: Identifiable

    var breeds: Breeds? { get }

    func breed(_ breed: Breed) -> BreedListItem
}

struct MockBreedListScreenFactory: BreedListScreenFactory {
    let breeds: [BreedListItem]?
    
    func makeScreenData() -> some BreedListScreenData {
        MockBreedListScreenData(breeds: breeds)
    }

    func inject(content: Content) -> some View {
        content
    }
}

struct MockBreedListScreenData: BreedListScreenData {
    struct Breed: Identifiable {
        var id: BreedListItem { breed }

        let breed: BreedListItem
    }

    init(breeds: [BreedListItem]?) {
        self.breeds = breeds.map { $0.map { .init(breed: $0) } }
    }

    var breeds: [Breed]?

    func breed(_ breed: Breed) -> BreedListItem {
        breed.breed
    }
}

// MARK: Components

enum BreedListScreenDestination: Hashable {
    case breedImage(breed: ConcreteBreed)
}

// MARK: Preview

#Preview {
    WithMockContainer(.app) { container in
        BreedListScreen(factory: container.makeBreedListScreenFactory())
    }
}
