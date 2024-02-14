//
//  DogImageResource.swift
//
//
//  Created by Mikhail Apurin on 2024-02-14.
//

import SwiftUI

public enum DogImageResource {
    case local(Image)
    
    case remote(URL)

    case placeholder

    public var remoteURL: URL? {
        if case let .remote(url) = self {
            url
        } else {
            nil
        }
    }
}
