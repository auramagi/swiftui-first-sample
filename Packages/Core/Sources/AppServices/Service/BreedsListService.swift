//
//  BreedsListService.swift
//  
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import AppUI
import Core
import Foundation

public final class BreedsListService {
    private let api: DogAPIClient
    
    private let state: AppState.BreedList
    
    private var lastRefresh = Date.distantPast
    
    public init(api: DogAPIClient, state: AppState.BreedList) {
        self.api = api
        self.state = state
    }
    
    public func connect(_ actions: inout AppActions.BreedList) {
        actions.refresh = refresh
    }
    
    func refresh() async {
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
