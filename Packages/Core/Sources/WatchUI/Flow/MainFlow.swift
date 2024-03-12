//
//  MainFlow.swift
//
//
//  Created by Mikhail Apurin on 2024-02-14.
//

import Core
import PreviewAssets
import SwiftUI

struct MainFlow<Container: WatchContainer>: View {
    let container: Container

    var body: some View {
        _Content(flow: self)
            .dependency(container)
    }
}

private struct _Content<Container: WatchContainer>: View {
    let flow: MainFlow<Container>
    
    public var body: some View {
        DogImageScreen(image: .random)
    }
}

#Preview {
    WithMockContainer(.watch(
        configuration: .init(
            defaultImage: .local(PreviewAsset.Image.kurosuke01)
        )
    )) { container in
        MainFlow(container: container)
    }
}
