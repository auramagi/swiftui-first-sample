//
//  RealmBreedListScreenFactory.swift
//
//
//  Created by Mikhail Apurin on 2024/02/14.
//

import AppUI
import Core
import RealmStorage
import RealmSwift
import SwiftUI

struct RealmBreedListScreenFactory: BreedListScreenFactory {
    let realmConfiguration: Realm.Configuration

    func makeScreenData() -> some BreedListScreenData {
        RealmBreedListScreenData()
    }

    func inject(content: Content) -> some View {
        content
            .environment(\.realmConfiguration, realmConfiguration)
    }
}

struct RealmBreedListScreenData: BreedListScreenData {
    @ObservedResults(BreedListObject.self) public var objects

    var breeds: RealmSwift.List<BreedListItemObject>? {
        objects.first?.breeds
    }

    func breed(_ breed: BreedListItemObject) -> BreedListItem {
        .init(object: breed)
    }
}
