//
//  BreedList.swift
//  
//
//  Created by Mikhail Apurin on 2024/02/22.
//

import Core
import Foundation

extension BreedList {
    public static var mock: Self {
        #if DEBUG
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
        #else
        []
        #endif
    }
}
