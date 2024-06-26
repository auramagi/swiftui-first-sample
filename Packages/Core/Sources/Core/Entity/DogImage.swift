//
//  DogImage.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Foundation

public enum DogImage: Sendable, Hashable {
    case random
    
    case breed(ConcreteBreed)
}
