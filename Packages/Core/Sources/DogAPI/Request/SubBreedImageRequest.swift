//
//  SubBreedImageRequest.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import Foundation

extension DogAPI {
    public enum SubBreedImageRequest {
        public enum All {
            public struct Get: DogAPIRequest {
                public typealias Message = [URL]

                public var path: String { "breed/\(breed)/\(subBreed)/images" }

                public let method = "GET"

                public let breed: Breed

                public let subBreed: SubBreed
                
                public init(breed: Breed, subBreed: SubBreed) {
                    self.breed = breed
                    self.subBreed = subBreed
                }
            }
        }

        public enum Random {
            public enum Single {
                public struct Get: DogAPIRequest {
                    public typealias Message = URL

                    public var path: String { "breed/\(breed)/\(subBreed)/images/random" }

                    public let method = "GET"

                    public let breed: Breed

                    public let subBreed: SubBreed
                    
                    public init(breed: Breed, subBreed: SubBreed) {
                        self.breed = breed
                        self.subBreed = subBreed
                    }
                }
            }

            public enum Multiple {
                public struct Get: DogAPIRequest {
                    public typealias Message = [URL]

                    public var path: String { "breed/\(breed)/\(subBreed)/images/random/\(count)" }

                    public let method = "GET"

                    public let breed: Breed

                    public let subBreed: SubBreed

                    public let count: Int
                    
                    public init(breed: Breed, subBreed: SubBreed, count: Int) {
                        self.breed = breed
                        self.subBreed = subBreed
                        self.count = count
                    }
                }
            }
        }
    }
}
