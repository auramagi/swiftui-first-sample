//
//  RandomImageFlow.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Core
import SwiftUI

struct RandomImageFlow<Container: AppContainer>: View {
    let container: Container
    
    var body: some View {
        NavigationStack {
            DogImageScreen(image: .random)
                .dependency(container)
                .navigationTitle("Random Dog")
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        RandomImageFlow(container: container)
    }
}
