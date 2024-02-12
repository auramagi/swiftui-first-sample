//
//  DogsApp.swift
//  Dogs
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import LiveApp
import SwiftUI

@main
struct DogsApp: App {
    static var configuration: LiveAppContainer.Configuration {
        .init()
    }
    
    @State var container = LiveAppContainer(configuration: configuration)
    
    var body: some Scene {
        WindowGroup {
            Text("Hello")
        }
    }
}
