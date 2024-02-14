//
//  DogImageScreen.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import CommonUI
import Core
import PreviewAssets
import SwiftUI

struct DogImageScreen: View {
    let image: DogImage
    
    @State private var state: LoadingState<DogImage, DogImageResource>?
    
    @Environment(\.appActions.dogImage) private var dogImage
    
    var body: some View {
        VStack {
            Group {
                switch state?.state {
                case let .completed(resource):
                    DogImageView(resource: resource)

                case .error:
                    TaskFailedView()

                case .inProgress, .none:
                    ProgressView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            Button {
                state = .init(input: image)
            } label: {
                Label("Reload", systemImage: "arrow.triangle.2.circlepath")
            }
            .buttonStyle(.borderedProminent)
            .disabled(state?.didFinish == false)
            .padding()
        }
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
        .onChange(of: image) { _ in
            state = .init(input: image)
        }
    }
}

#Preview {
    DogImageScreen(image: .random)
        .mockContainer(.app { container in
            container.app.actions.dogImage.getImage = { _ in
                try await Task.sleep(for: .seconds(1))
                return .local(PreviewAsset.Image.kurosuke01!)
//                return .remote(URL(string: "https://images.dog.ceo/breeds/shiba/shiba-3i.jpg")!)
            }
        })
}

#Preview("Error") {
    DogImageScreen(image: .random)
        .mockContainer(.app)
}
