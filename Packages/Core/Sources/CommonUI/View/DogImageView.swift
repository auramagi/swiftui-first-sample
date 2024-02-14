//
//  DogImageView.swift
//
//
//  Created by Mikhail Apurin on 2024-02-14.
//

import Core
import SwiftUI

public struct DogImageView: View {
    let resource: DogImageResource
    
    public init(resource: DogImageResource) {
        self.resource = resource
    }
    
    public var body: some View {
        switch resource {
        case let .local(image):
            image
                .resizable()
                .scaledToFit()
            
        case let .remote(url):
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

        case .placeholder:
            Color.clear
        }
    }
}
