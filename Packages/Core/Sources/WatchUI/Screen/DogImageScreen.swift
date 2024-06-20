//
//  DogImageScreen.swift
//
//
//  Created by Mikhail Apurin on 2024-02-14.
//

import Core
import CommonUI
import PreviewAssets
import SwiftUI

struct DogImageScreen: View {
    let image: DogImage
    
    @State private var state: LoadingState<DogImage, DogImageResource>?
    
    @Environment(\.watchActions) private var actions

    var body: some View {
        Group {
            switch state?.state {
            case .none, .inProgress:
                ProgressView()
                
            case let .completed(url):
                DogImageView(resource: url)
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            case let .error(error):
                Text(error.localizedDescription)
            }
        }
        .onTapGesture { state = .init(input: image) }
        .accessibilityAction(named: "Reload") { state = .init(input: image) }
        .task(id: state?.id) {
            if let state {
                guard !state.didFinish else { return } // Don't reload on each appearance
                do {
                    let url = try await actions.dogImage.getImage(state.input)
                    self.state?.state = .completed(url)
                } catch is CancellationError {
                    
                } catch {
                    self.state?.state = .error(error)
                }
            } else {
                state = .init(input: image)
            }
        }
    }
}

#Preview {
    DogImageScreen(image: .random)
        .mockContainer(.watch(
            configuration: .init(
                defaultImage: .local(PreviewAsset.Image.kurosuke01)
//                defaultImage: .remote(URL(string: "https://images.dog.ceo/breeds/shiba/shiba-3i.jpg")!)
            )
        ))
}

#Preview("Error") {
    DogImageScreen(image: .random)
        .mockContainer(.watch {
            $0.watch.actions.dogImage.getImage = { _ in throw .message("This is an error") }
        })
}
