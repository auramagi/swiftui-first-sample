//
//  BreedListRequest.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import Foundation

extension DogAPI {
    enum BreedListRequest {
        struct Get: DogAPIRequest {
            typealias Message = BreedList

            let path = "breeds/list/all"

            let method = "GET"
        }
    }
}
