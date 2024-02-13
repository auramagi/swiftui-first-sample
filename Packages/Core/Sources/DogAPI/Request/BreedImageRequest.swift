//
//  BreedImageRequest.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import Foundation

extension DogAPI {
    public enum BreedImageRequest {
        public enum All {
            public struct Get: DogAPIRequest {
                public typealias Message = [URL]

                public var path: String { "breed/\(breed)/images" }

                public let method = "GET"

                public let breed: Breed
                
                public init(breed: Breed) {
                    self.breed = breed
                }
            }
        }

        public enum Random {
            public enum Single {
                public struct Get: DogAPIRequest {
                    public typealias Message = URL

                    public var path: String { "breed/\(breed)/images/random" }

                    public let method = "GET"

                    public let breed: Breed
                    
                    public init(breed: Breed) {
                        self.breed = breed
                    }
                }
            }

            public enum Multiple {
                public struct Get: DogAPIRequest {
                    public typealias Message = [URL]

                    public var path: String { "breed/\(breed)/images/random/\(count)" }

                    public let method = "GET"

                    public let breed: Breed

                    public let count: Int
                    
                    public init(breed: Breed, count: Int) {
                        self.breed = breed
                        self.count = count
                    }
                }
            }
        }
    }
}
