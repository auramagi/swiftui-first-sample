//
//  RealmFavoritesGridView.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import AppUI
import RealmStorage
import RealmSwift
import SwiftUI

struct RealmFavoritesGridView: View {
    @ObservedResults(FavoritesItemObject.self) public var objects

    var body: some View {
        if objects.isEmpty {
            FavoritesEmptyView()
        } else {
            FavoritesGridContent {
                ForEach(objects) { item in
                    RealmFavoritesGridItem(object: item)
                }
            }
        }
    }
}

private struct RealmFavoritesGridItem: View {
    @ObservedRealmObject var object: FavoritesItemObject

    var body: some View {
        FavoritesGridItem(item: .init(object: object)!)
    }
}



