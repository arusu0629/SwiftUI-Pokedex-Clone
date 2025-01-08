//
//  RootViewContainer+DependencyKey.swift
//  SwiftUI-Pokedex-Clone
//
//  Created by af_nakandakari_toru on 2025/01/08.
//

public import Dependencies
public import DependencyContainer
import RootScreen
import Router
import SwiftUI

extension RootViewContainer: @retroactive DependencyKey {

    public static var liveValue: Self {
        .init { router, input in
            AnyView(
                RootView(router: router as! Router, input: input)
            )
        }
    }
}
