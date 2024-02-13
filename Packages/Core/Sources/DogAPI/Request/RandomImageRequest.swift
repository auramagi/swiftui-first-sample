//
//  RandomImageRequest.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import Foundation

extension DogAPI {
    public enum RandomImageRequest {
        public enum Single {
            public struct Get: DogAPIRequest {
                public typealias Message = URL
                
                public let path = "breeds/image/random"
                
                public let method = "GET"
                
                public init() { }
            }
        }
        
        public enum Multiple {
            public struct Get: DogAPIRequest {
                public typealias Message = [URL]
                
                public var path: String { "breeds/image/random/\(count)" }
                
                public let method = "GET"
                
                public let count: Int
                
                public init(count: Int) {
                    self.count = count
                }
            }
        }
    }
}
