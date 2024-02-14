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

struct FavoritesScreen<FavoritesGrid: View>: View {
    let grid: FavoritesGrid

    @AppStorage(SettingsKey.Favorites.prefersFill) private var prefersFill = false

    var body: some View {
        grid
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

public struct FavoritesGridContent<Content: View>: View {
    let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 100, maximum: 200), spacing: 8)],
                alignment: .leading,
                spacing: 8
            ) {
                content
            }
            .padding()
        }
    }
}

public struct FavoritesGridItem: View {
    let item: FavoritesItem

    @AppStorage(SettingsKey.Favorites.prefersFill) private var prefersFill = false

    public init(item: FavoritesItem) {
        self.item = item
    }

    public var body: some View {
        DogImageView(resource: item.resource)
            .aspectRatio(contentMode: prefersFill ? .fill : .fit)
            .frame(minWidth: prefersFill ? 0 : nil, maxWidth: prefersFill ? .infinity : nil, minHeight: prefersFill ? 0 : nil, maxHeight: prefersFill ? .infinity : nil)
            .clipShape(.rect(cornerRadius: 4))
            .frame(minWidth: prefersFill ? nil : 0, maxWidth: prefersFill ? nil : .infinity, minHeight: prefersFill ? nil : 0, maxHeight: prefersFill ? nil : .infinity)
            .aspectRatio(1, contentMode: .fill)
            .animation(.default, value: prefersFill)
    }
}

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
            FavoritesScreen(grid: container.makeFavoritesGrid())
        }
        .navigationTitle("Favorites")
    }
}

#Preview("Empty") {
    NavigationStack {
        WithMockContainer(.app) { container in
            FavoritesScreen(grid: container.makeFavoritesGrid())
        }
        .navigationTitle("Favorites")
    }
}
