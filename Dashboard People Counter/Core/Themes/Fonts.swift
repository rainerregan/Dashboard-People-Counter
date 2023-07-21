//
//  Fonts.swift
//  TryMacOS
//
//  Created by ndyyy on 20/07/23.
//

import SwiftUI


extension Font {
    enum sizeFont: Int {
        case custom112 = 112
        case custom96 = 96
        case custom75 = 75
        case custom64 = 64
        case custom42 = 42
        case custom32 = 32
        case custom24 = 24
        case custom12 = 12
        case custom8 = 8
    }

    static func SFProDisplay(_ size: sizeFont) -> Font {
        return .custom("SF Pro Display", size: CGFloat(size.rawValue))
    }
}
