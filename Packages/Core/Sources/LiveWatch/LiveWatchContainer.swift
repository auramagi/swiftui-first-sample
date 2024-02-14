//
//  LiveWatchContainer.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import DogAPI
import Core
import CommonServices
import SwiftUI
import WatchServices
import WatchUI

public final class LiveWatchContainer: WatchContainer {
    public struct Configuration {
        let apiBaseURL: URL
        
        public init(
            apiBaseURL: URL
        ) {
            self.apiBaseURL = apiBaseURL
        }
    }
    
    public let configuration: Configuration
    
    public var watch: WatchDependency
    
    let api: DogAPIClient
    
    let dogImageService: DogImageService
    
    public init(configuration: Configuration) {
        self.configuration = configuration
        self.watch = .init(
            state: .init(),
            actions: .init()
        )
        self.api = .init(
            session: .shared,
            configuration: .init(baseURL: configuration.apiBaseURL)
        )
        self.dogImageService = .init(api: api)
        
        watch.actions.dogImage.getImage = dogImageService.getImage(_:)
    }
}
