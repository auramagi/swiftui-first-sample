//
//  DogAPIResponse.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Foundation

public struct DogAPIResponse<Message: Decodable>: Decodable {
    public let message: Message

    public let status: String
}
