//
//  PreviewAssets.swift
//
//
//  Created by Mikhail Apurin on 2024-02-14.
//

import SwiftUI

public enum PreviewAsset { }

extension PreviewAsset {
    public enum Image {
        public static var kurosuke01: SwiftUI.Image? { .init("kurosuke01", bundle: .module) }
    }
}
