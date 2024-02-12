//
//  BreedListFlow.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

struct BreedListFlow<Container: AppContainer>: View {
    let container: Container
    
    var body: some View {
        NavigationStack {
            BreedListScreen()
                .dependency(container)
                .navigationTitle("Breeds")
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        BreedListFlow(container: container)
    }
}
