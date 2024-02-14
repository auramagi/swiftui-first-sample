//
//  AppFlow.swift
//
//
//  Created by Mikhail Apurin on 2024-02-14.
//

import Core
import PreviewAssets
import SwiftUI

public struct AppFlow<Container: WatchContainer>: View {
    let container: Container
    
    public init(container: Container) {
        self.container = container
    }
    
    public var body: some View {
        DogImageScreen(image: .random)
            .dependency(container)
    }
}

#Preview {
    WithMockContainer(.watch(
        configuration: .init(
            defaultImage: .local(PreviewAsset.Image.kurosuke01)
        )
    )) { container in
        AppFlow(container: container)
    }
}
