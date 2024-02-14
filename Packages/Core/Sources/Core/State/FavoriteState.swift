//
//  FavoriteState.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import Foundation

public final class FavoriteState: ObservableObject {
    @Published public var canFavorite = false

    @Published public var isFavorited = false

    public init() { }
}
