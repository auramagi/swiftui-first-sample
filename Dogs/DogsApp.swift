//
//  DogsApp.swift
//  Dogs
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import AppUI
import LiveApp
import SwiftUI

@main
struct DogsApp: App {
    static var configuration: LiveAppContainer.Configuration {
        .init(
            apiBaseURL: .init(string: "https://dog.ceo/api")!
        )
    }
    
    @State var container = LiveAppContainer(configuration: configuration)
    
    var body: some Scene {
        WindowGroup {
            AppFlow(container: container)
                .dependency(container)
        }
    }
}
