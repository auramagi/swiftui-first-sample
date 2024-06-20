//
//  DogsApp.swift
//  Dogs
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import LiveApp
import SwiftUI

@main
@MainActor
struct DogsApp: App {
    static var configuration: LiveAppContainer.Configuration {
        .init(
            apiBaseURL: .init(string: "https://dog.ceo/api")!
        )
    }
    
    @State var container = LiveAppContainer(configuration: configuration)
    
    var body: some Scene {
        WindowGroup {
            container.app
        }
    }
}
