//
//  RealmBreedListView.swift
//
//
//  Created by Mikhail Apurin on 2024/02/14.
//

import AppUI
import RealmStorage
import RealmSwift
import SwiftUI

struct RealmBreedListView: View {
    @ObservedResults(BreedListObject.self) public var objects

    var body: some View {
        List {
            if let list = objects.first {
                ForEach(list.breeds) { breed in
                    RealmBreedListRow(object: breed)
                }
            }
        }
    }
}

private struct RealmBreedListRow: View {
    @ObservedRealmObject var object: BreedListItemObject

    var body: some View {
        BreedListRow(item: .init(object: object))
    }
}
