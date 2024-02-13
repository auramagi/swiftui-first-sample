//
//  BreedListRequest.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import Foundation

extension DogAPI {
    public enum BreedListRequest {
        public struct Get: DogAPIRequest {
            public typealias Message = BreedList

            public let path = "breeds/list/all"

            public let method = "GET"
            
            public init() { }
        }
    }
}
