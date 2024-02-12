//
//  SubBreedImageRequest.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import Foundation

extension DogAPI {
    enum SubBreedImageRequest {
        enum All {
            struct Get: DogAPIRequest {
                typealias Message = [URL]

                var path: String { "breed/\(breed)/\(subBreed)/images" }

                let method = "GET"

                let breed: Breed

                let subBreed: SubBreed
            }
        }

        enum Random {
            enum Single {
                struct Get: DogAPIRequest {
                    typealias Message = URL

                    var path: String { "breed/\(breed)/\(subBreed)/images/random" }

                    let method = "GET"

                    let breed: Breed

                    let subBreed: SubBreed
                }
            }

            enum Multiple {
                struct Get: DogAPIRequest {
                    typealias Message = [URL]

                    var path: String { "breed/\(breed)/\(subBreed)/images/random/\(count)" }

                    let method = "GET"

                    let breed: Breed

                    let subBreed: SubBreed

                    let count: Int
                }
            }
        }
    }
}
