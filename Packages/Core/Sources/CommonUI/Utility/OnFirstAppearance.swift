//
//  OnFirstAppearance.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import SwiftUI

struct OnFirstAppearance: ViewModifier {
    @State private var didAppear = false
    
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear {
                guard !didAppear else { return }
                didAppear = true
                action()
            }
    }
}

extension View {
    public func onFirstAppear(perform action: @escaping () -> Void) -> some View {
        modifier(OnFirstAppearance(action: action))
    }
}
