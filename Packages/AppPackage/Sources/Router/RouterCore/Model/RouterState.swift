//
//  RouterState.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/07.
//

import Entity
import SwiftUI

// MARK: - RouterState
public struct RouterState {
    var navigationPath: [Screen]
    var presentingSheet: Screen?
    var presentingFullScreen: Screen?
    var isPresented: Binding<Screen?>

    public init(
        navigationPath: [Screen] = [],
        presentingSheet: Screen? = nil,
        presentingFullScreen: Screen? = nil,
        isPresented: Binding<Screen?>
    ) {
        self.navigationPath = navigationPath
        self.presentingSheet = presentingSheet
        self.presentingFullScreen = presentingFullScreen
        self.isPresented = isPresented
    }
}

extension RouterState {

    public var isPresenting: Bool {
        presentingSheet != nil || presentingFullScreen != nil
    }
}
