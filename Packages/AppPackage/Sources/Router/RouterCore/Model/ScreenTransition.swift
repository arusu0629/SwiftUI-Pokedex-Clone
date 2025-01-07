//
//  ScreenTransition.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/07.
//

import Entity
import Foundation

public enum ScreenTransition {
    case push
    case sheet
    case fullScreen
    case alert

    public var withNavigation: Bool {
        switch self {
        case .push,
             .alert:
            false
        case .sheet,
             .fullScreen:
            true
        }
    }

    public var naviBarLeadingButtonType: ToolbarButtonType? {
        switch self {
        case .push:
            .back
        case .fullScreen:
            .close
        case .alert,
             .sheet:
             nil
        }
    }
}
