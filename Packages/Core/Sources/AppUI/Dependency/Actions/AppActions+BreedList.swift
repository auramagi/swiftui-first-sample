//
//  AppActions+BreedList.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import Foundation

extension AppActions {
    @MainActor public struct BreedList {
        public var refresh: () async -> Void = emptyAction()

        nonisolated init() { }
    }
}
