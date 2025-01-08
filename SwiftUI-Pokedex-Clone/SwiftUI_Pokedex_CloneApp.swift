//
//  SwiftUI_Pokedex_CloneApp.swift
//  SwiftUI-Pokedex-Clone
//
//  Created by af_nakandakari_toru on 2025/01/02.
//

import Dependencies
import Entity
import RootScreen
import Router
import SwiftUI

@main
struct SwiftUI_Pokedex_CloneApp: App {

    @Dependency(\.rootViewContainer) private var rootViewContainer

    var body: some Scene {
        WindowGroup {
            rootViewContainer.view(
                Router(isPresented: .init(.constant(.root))),
                CommonScreenInput(
                    withNavigation: false,
                    naviBarLeadingButtonType: nil
                )
            )
        }
    }
}
