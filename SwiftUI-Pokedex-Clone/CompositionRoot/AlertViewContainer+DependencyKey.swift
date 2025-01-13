//
//  AlertViewContainer+DependencyKey.swift
//  SwiftUI-Pokedex-Clone
//
//  Created by af_nakandakari_toru on 2025/01/13.
//

import AlertScreen
public import Dependencies
public import DependencyContainer
import Router
import SwiftUI

extension AlertViewContainer: @retroactive DependencyKey {

    public static var liveValue: Self {
        .init { router, input, error, buttons in
            AnyView(
                AlertView(
                    router: router as! Router,
                    input: input,
                    error: error,
                    buttons: buttons
                )
            )
        }
    }
}
