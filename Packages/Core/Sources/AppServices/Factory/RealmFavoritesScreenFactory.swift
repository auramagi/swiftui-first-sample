//
//  RealmFavoritesScreenFactory.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import AppUI
import Core
import RealmStorage
import RealmSwift
import SwiftUI

public struct RealmFavoritesScreenFactory: FavoritesScreenFactory {
    public let realmConfiguration: Realm.Configuration

    public init(realmConfiguration: Realm.Configuration) {
        self.realmConfiguration = realmConfiguration
    }

    public func makeScreenData() -> some FavoritesScreenData {
        RealmFavoritesScreenData()
    }

    public func inject(content: Content) -> some View {
        content
            .environment(\.realmConfiguration, realmConfiguration)
    }
}

public struct RealmFavoritesScreenData: FavoritesScreenData {
    @ObservedResults(FavoritesItemObject.self) public var items

    public func item(_ item: Item) -> FavoritesItem {
        .init(object: item)
    }
}
