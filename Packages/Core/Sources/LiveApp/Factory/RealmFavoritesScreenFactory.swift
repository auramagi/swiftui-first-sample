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

struct RealmFavoritesScreenFactory: FavoritesScreenFactory {
    let realmConfiguration: Realm.Configuration

    func makeScreenData() -> some FavoritesScreenData {
        RealmFavoritesScreenData()
    }

    func inject(content: Content) -> some View {
        content
            .environment(\.realmConfiguration, realmConfiguration)
    }
}

struct RealmFavoritesScreenData: FavoritesScreenData {
    @ObservedResults(FavoritesItemObject.self) var items

    func item(_ item: Item) -> FavoritesItem {
        .init(object: item)
    }
}
