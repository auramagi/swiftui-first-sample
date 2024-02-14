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

            HStack(spacing: 8) {
                Button {
                    state = .init(input: image)
                } label: {
                    Label("Reload", systemImage: "arrow.triangle.2.circlepath")
                }
                .buttonStyle(.borderedProminent)
                .disabled(state?.didFinish == false)

                DogImageFavoriteButton(resource: state?.value)
                    .id(state?.value?.remoteURL)
            }
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

struct DogImageFavoriteButton: View {
    let resource: DogImageResource?

    @StateObject private var state = FavoriteState()

    @Environment(\.appActions.favorites) private var favorites

    var body: some View {
        Button {
            guard let resource else { return }
            if state.isFavorited {
                try? favorites.unfavorite(resource)
            } else {
                try? favorites.favorite(resource)
            }
        } label: {
            Label(state.isFavorited ? "Unfavorite" : "Favorite", systemImage: "star")
                .labelStyle(.iconOnly)
                .symbolVariant(state.isFavorited ? .fill : .none)
        }
        .buttonStyle(.borderedProminent)
        .disabled(!state.canFavorite)
        .padding()
        .onFirstAppear {
            guard let resource else { return }
            favorites.connect(state, resource)
        }
    }
}

#Preview {
    DogImageScreen(image: .random)
        .mockContainer(.app(
            configuration: .init(
                defaultImage: .local(PreviewAsset.Image.kurosuke01)
//                defaultImage: .remote(URL(string: "https://images.dog.ceo/breeds/shiba/shiba-3i.jpg")!)
            )
        ))
}

#Preview("Error") {
    DogImageScreen(image: .random)
        .mockContainer(.app)
}
