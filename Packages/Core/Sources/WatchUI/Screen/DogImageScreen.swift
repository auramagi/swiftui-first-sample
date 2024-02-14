//
//  DogImageScreen.swift
//
//
//  Created by Mikhail Apurin on 2024-02-14.
//

import Core
import CommonUI
import SwiftUI

struct DogImageScreen: View {
    let image: DogImage
    
    @State private var state: LoadingState<DogImage, DogImageResource>?
    
    @Environment(\.watchActions.dogImage) private var dogImage
    
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
                    let url = try await dogImage.getImage(state.input)
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
        .mockContainer(.watch { container in
            container.watch.actions.dogImage.getImage = { _ in
                try await Task.sleep(for: .seconds(1))
                return .remote(URL(string: "https://images.dog.ceo/breeds/shiba/shiba-3i.jpg")!)
            }
        })
}

#Preview("Error") {
    DogImageScreen(image: .random)
        .mockContainer(.watch)
}
