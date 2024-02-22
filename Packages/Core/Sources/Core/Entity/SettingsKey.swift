//
//  SettingsKey.swift
//
//
//  Created by Mikhail Apurin on 2024/02/14.
//

import Foundation

public enum SettingsKey { }

extension SettingsKey {
    public enum Welcome {
        public static let didShow = "Welcome/didShow"
    }
}

extension SettingsKey {
    public enum Favorites {
        public static let prefersFill = "Favorites/prefersFill"
    }
}
