//
//  AspectToken.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/07.
//

import Foundation

public enum AspectToken {
    case square
    case mainVisual
    case thumbnail

    public var value: CGFloat {
        switch self {
        case .square:
            1.0
        case .mainVisual:
            718.0 / 537.0
        case .thumbnail:
            1.0 / 1.414
        }
    }
}
