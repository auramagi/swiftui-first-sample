//
//  DogImageScreen.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import CommonUI
import Core
import SwiftUI

struct DogImageScreen: View {
    let image: DogImage
    
    @State private var state: LoadingState<DogImage, URL>?
    
    @Environment(\.appActions.dogImage) private var dogImage
    
    var body: some View {
        VStack {
            Group {
                switch state?.state {
                case let .completed(url):
                    DogImageView(url: url)

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

private struct DogImageView: View {
    let url: URL

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()

            case let .success(image):
                image
                    .resizable()
                    .scaledToFit()

            case .failure:
                TaskFailedView()

            @unknown default:
                ProgressView()
            }
        }
    }
}

#Preview {
    DogImageScreen(image: .random)
        .mockContainer(.app { container in
            container.app.actions.dogImage.getImage = { _ in
                try await Task.sleep(for: .seconds(1))
                return URL(string: "https://images.dog.ceo/breeds/shiba/shiba-3i.jpg")!
            }
        })
}

#Preview("Error") {
    DogImageScreen(image: .random)
        .mockContainer(.app)
}
