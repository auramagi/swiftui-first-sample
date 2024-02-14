//
//  BreedListObject.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-14.
//

import Core
import Foundation
import RealmSwift

public final class BreedListObject: Object, ObjectKeyIdentifiable {
    @Persisted public var breeds: List<BreedListItemObject>
}
