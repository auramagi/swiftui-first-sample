//
//  FavoritesEmptyView.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import SwiftUI

public struct FavoritesEmptyView: View {
    public init() { }

    public var body: some View {
        if #available(iOS 17.0, *) {
            ContentUnavailableView("No Favorites", systemImage: "star")
                .symbolVariant(.slash.fill)
        } else {
            VStack(spacing: 16) {
                Image(systemName: "star")
                    .imageScale(.large)
                    .foregroundStyle(.secondary)
                    .symbolVariant(.slash.fill)
                    .font(.largeTitle)

                Text("No Favorites")
                    .font(.title2.bold())
            }
        }
    }
}

#Preview {
    FavoritesEmptyView()
}
