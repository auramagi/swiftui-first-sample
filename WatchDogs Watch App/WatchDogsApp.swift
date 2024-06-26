//
//  WatchDogsApp.swift
//  WatchDogs Watch App
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import LiveWatch
import SwiftUI
import WatchUI

@main
@MainActor
struct WatchDogsApp: App {
    static var configuration: LiveWatchContainer.Configuration {
        .init(
            apiBaseURL: .init(string: "https://dog.ceo/api")!
        )
    }
    
    @State var container = LiveWatchContainer(configuration: configuration)
    
    var body: some Scene {
        WindowGroup {
            container.watch
        }
    }
}
