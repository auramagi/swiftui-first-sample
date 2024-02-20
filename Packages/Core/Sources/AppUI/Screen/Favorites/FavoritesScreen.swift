//
//  FavoritesScreen.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import CommonUI
import Core
import PreviewAssets
import SwiftUI

struct FavoritesScreen<Factory: FavoritesScreenFactory>: View {
    let factory: Factory

    @AppStorage(SettingsKey.Favorites.prefersFill) private var prefersFill = false

    var body: some View {
        WithProperty(factory.makeScreenData()) { screenData in
            if screenData.items.isEmpty {
                FavoritesEmptyView()
            } else {
                ScrollView {
                    LazyVGrid(
                        columns: [GridItem(.adaptive(minimum: 100, maximum: 200), spacing: 8)],
                        alignment: .leading,
                        spacing: 8
                    ) {
                        ForEach(screenData.items) { item in
                            FavoritesGridItem(item: screenData.item(item))
                        }
                    }
                    .padding()
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            prefersFill.toggle()
                        } label: {
                            Label(
                                prefersFill ? "Fit" : "Fill",
                                systemImage: prefersFill ? "arrow.down.right.and.arrow.up.left" : "arrow.up.left.and.arrow.down.right"
                            )
                        }
                    }
                }
            }
        }
        .dependency(factory)
    }
}

// MARK: Factory

public protocol FavoritesScreenFactory: ViewInjectable {
    associatedtype ScreenData: FavoritesScreenData
    func makeScreenData() -> ScreenData
}

public protocol FavoritesScreenData: DynamicProperty {
    typealias Item = Items.Element

    associatedtype Items: RandomAccessCollection where Item: Identifiable

    var items: Items { get }

    func item(_ item: Item) -> FavoritesItem
}

struct MockFavoritesScreenFactory: FavoritesScreenFactory {
    let items: [FavoritesItem]

    func makeScreenData() -> some FavoritesScreenData {
        MockFavoritesScreenData(items: items)
    }

    func inject(content: Content) -> some View {
        content
    }
}

struct MockFavoritesScreenData: FavoritesScreenData {
    let items: [FavoritesItem]

    func item(_ item: Item) -> FavoritesItem {
        item
    }
}

// MARK: Components

struct FavoritesGridItem: View {
    let item: FavoritesItem

    @AppStorage(SettingsKey.Favorites.prefersFill) private var prefersFill = false

    var body: some View {
        DogImageView(resource: item.resource)
            .aspectRatio(contentMode: prefersFill ? .fill : .fit)
            .frame(minWidth: prefersFill ? 0 : nil, maxWidth: prefersFill ? .infinity : nil, minHeight: prefersFill ? 0 : nil, maxHeight: prefersFill ? .infinity : nil)
            .clipShape(.rect(cornerRadius: 4))
            .frame(minWidth: prefersFill ? nil : 0, maxWidth: prefersFill ? nil : .infinity, minHeight: prefersFill ? nil : 0, maxHeight: prefersFill ? nil : .infinity)
            .aspectRatio(1, contentMode: .fill)
            .animation(.default, value: prefersFill)
    }
}

// MARK: Preview

private let previewFavorites = [
    FavoritesItem(id: .init(), resource: .local(PreviewAsset.Image.kurosuke01)),
    FavoritesItem(id: .init(), resource: .local(PreviewAsset.Image.kurosuke01)),
    FavoritesItem(id: .init(), resource: .local(PreviewAsset.Image.kurosuke01)),
    FavoritesItem(id: .init(), resource: .local(PreviewAsset.Image.kurosuke01)),
    FavoritesItem(id: .init(), resource: .local(PreviewAsset.Image.kurosuke01)),
    FavoritesItem(id: .init(), resource: .local(PreviewAsset.Image.kurosuke01)),
    FavoritesItem(id: .init(), resource: .local(PreviewAsset.Image.kurosuke01)),
    FavoritesItem(id: .init(), resource: .local(PreviewAsset.Image.kurosuke01)),
    FavoritesItem(id: .init(), resource: .local(PreviewAsset.Image.kurosuke01)),
    FavoritesItem(id: .init(), resource: .local(PreviewAsset.Image.kurosuke01)),
    FavoritesItem(id: .init(), resource: .local(PreviewAsset.Image.kurosuke01)),
]

#Preview {
    NavigationStack {
        WithMockContainer(.app(configuration: .init(favorites: previewFavorites))) { container in
            FavoritesScreen(factory: container.makeFavoritesScreenFactory())
        }
        .navigationTitle("Favorites")
    }
}

#Preview("Empty") {
    NavigationStack {
        WithMockContainer(.app) { container in
            FavoritesScreen(factory: container.makeFavoritesScreenFactory())
        }
        .navigationTitle("Favorites")
    }
}
