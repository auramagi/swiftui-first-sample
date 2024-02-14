//
//  BreedsListService.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import DogAPI
import Foundation

public final class BreedsListService {
    private let api: DogAPIClient
    
    private let state: BreedListState
    
    private var lastRefresh = Date.distantPast
    
    public init(api: DogAPIClient, state: BreedListState) {
        self.api = api
        self.state = state
    }
    
    public func refresh() async {
        guard Date.now.timeIntervalSince(lastRefresh) > 60 else { return } // Throttle reloads for 60s
        do {
            let breeds = try await api.execute(DogAPI.BreedListRequest.Get())
            await MainActor.run {
                state.breeds = breeds.message.map()
            }
            lastRefresh = .now
        } catch {
            print(error)
        }
    }
}
