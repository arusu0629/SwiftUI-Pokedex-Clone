//
//  PokemonListViewContainer+DependencyKey.swift
//  SwiftUI-Pokedex-Clone
//
//  Created by af_nakandakari_toru on 2025/01/08.
//

public import Dependencies
public import DependencyContainer
import PokemonListScreen
import Router
import SwiftUI

extension PokemonListViewContainer: @retroactive DependencyKey {

    public static var liveValue: Self {
        .init { router, input, trigger in
            AnyView(
                PokemonListView(
                    router: router as! Router,
                    input: input,
                    trigger: trigger
                )
            )
        }
    }
}
