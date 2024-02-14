//
//  ErrorAlertServiceView.swift
//
//
//  Created by Mikhail Apurin on 2024/02/15.
//

import SwiftUI

struct ErrorAlertServiceView: ViewModifier {
    @EnvironmentObject private var errorAlertState: AppState.ErrorAlert

    func body(content: Content) -> some View {
        content
            .alert("Error", isPresented: isPresented, presenting: errorAlertState.alert) { error in
                // Only the OK button
            } message: { error in
                Text(error.message)
            }
    }

    var isPresented: Binding<Bool> {
        .init(
            get: { errorAlertState.alert != nil },
            set: { _ in errorAlertState.alert = nil }
        )
    }
}

extension View {
    func withErrorAlertService() -> some View {
        modifier(ErrorAlertServiceView())
    }
}
