//
//  BreedListItem.swift
//
//
//  Created by Mikhail Apurin on 2024/02/22.
//

import Core
import Foundation

extension [BreedListItem] {
    public static func mock(_ list: BreedList = .mock) -> Self {
        list.map()
    }
}
