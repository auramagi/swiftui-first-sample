//
//  BreedListState.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-14.
//

import Foundation

open class BreedListState: ObservableObject {
    @Published public var breeds: [BreedListItem] = []
    
    public init() { }
}
