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

public struct RealmBreedListScreenFactory: BreedListScreenFactory {
    public let realmConfiguration: Realm.Configuration

    public init(realmConfiguration: Realm.Configuration) {
        self.realmConfiguration = realmConfiguration
    }

    public func makeScreenData() -> some BreedListScreenData {
        RealmBreedListScreenData()
    }

    public func inject(content: Content) -> some View {
        content
            .environment(\.realmConfiguration, realmConfiguration)
    }
}

public struct RealmBreedListScreenData: BreedListScreenData {
    @ObservedResults(BreedListObject.self) public var objects

    public var breeds: RealmSwift.List<BreedListItemObject>? {
        objects.first?.breeds
    }

    public func breed(_ breed: BreedListItemObject) -> BreedListItem {
        .init(object: breed)
    }
}
