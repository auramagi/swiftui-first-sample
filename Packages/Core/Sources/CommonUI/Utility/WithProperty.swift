//
//  WithProperty.swift
//
//
//  Created by Mikhail Apurin on 2024/02/20.
//

import SwiftUI

public struct WithProperty<Property: DynamicProperty, Content: View>: View {
    let property: Property

    var content: (Property) -> Content

    public init(_ property: Property, @ViewBuilder content: @escaping (Property) -> Content) {
        self.property = property
        self.content = content
    }

    public var body: some View {
        content(property)
    }
}
