//
//  LiveAppContainer.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import AppServices
import AppUI
import SwiftUI

public final class LiveAppContainer: AppContainer {
    public struct Configuration {
        let apiBaseURL: URL
        
        public init(
            apiBaseURL: URL
        ) {
            self.apiBaseURL = apiBaseURL
        }
    }
    
    public let configuration: Configuration
    
    public var app: AppDependency
    
    let api: DogAPIClient
    
    let dogImageService: DogImageService
    
    public init(configuration: Configuration) {
        self.configuration = configuration
        self.app = .init(
            state: .init(),
            actions: .init()
        )
        self.api = .init(
            session: .shared,
            configuration: .init(baseURL: configuration.apiBaseURL)
        )
        self.dogImageService = .init(api: api)
        dogImageService.connect(&app.actions.dogImage)
    }
}
