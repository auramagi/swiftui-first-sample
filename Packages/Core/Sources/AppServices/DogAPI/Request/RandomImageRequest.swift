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
            struct Get: DogAPIRequest {
                typealias Message = URL
                
                let path = "breeds/image/random"
                
                let method = "GET"
                
            }
        }
        
        public enum Multiple {
            struct Get: DogAPIRequest {
                typealias Message = [URL]
                
                var path: String { "breeds/image/random/\(count)" }
                
                let method = "GET"
                
                let count: Int
            }
        }
    }
}
