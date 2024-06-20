//
//  AppState+ErrorAlert.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import Core
import Foundation

extension AppState {
    @MainActor public final class ErrorAlert: ObservableObject {
        @Published public var alert: DisplayableError?

        public init() { }
    }
}
