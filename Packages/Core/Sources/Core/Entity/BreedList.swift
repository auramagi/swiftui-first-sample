//
//  BreedList.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Foundation

public typealias BreedList = [Breed: [SubBreed]]

extension BreedList {
    public static var mock: Self {
        [
            "affenpinscher": [],
            "african": [],
            "airedale": [],
            "akita": [],
            "appenzeller": [],
            "australian": [
                "shepherd"
            ],
        ]
    }
}
