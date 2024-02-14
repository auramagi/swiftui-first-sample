//
//  UserDefaults+.swift
//  
//
//  Created by Mikhail Apurin on 2024/02/14.
//

import Foundation

extension UserDefaults {
    public static func mock(name: String = UUID().uuidString) -> UserDefaults {
        let defaults = UserDefaults(suiteName: name)!
        defaults.removePersistentDomain(forName: name)
        return defaults
    }
}
