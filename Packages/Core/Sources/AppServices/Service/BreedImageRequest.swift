//
//  BreedImageRequest.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import Foundation

extension DogAPI {
    enum BreedImageRequest {
        enum All {
            struct Get: DogAPIRequest {
                typealias Message = [URL]

                var path: String { "breed/\(breed)/images" }

                let method = "GET"

                let breed: Breed
            }
        }

        enum Random {
            enum Single {
                struct Get: DogAPIRequest {
                    typealias Message = URL

                    var path: String { "breed/\(breed)/images/random" }

                    let method = "GET"

                    let breed: Breed
                }
            }

            enum Multiple {
                struct Get: DogAPIRequest {
                    typealias Message = [URL]

                    var path: String { "breed/\(breed)/images/random/\(count)" }

                    let method = "GET"

                    let breed: Breed

                    let count: Int
                }
            }
        }
    }
}
