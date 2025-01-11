//
//  FavoritePokemonListViewContainer+DependencyKey.swift
//  SwiftUI-Pokedex-Clone
//
//  Created by af_nakandakari_toru on 2025/01/11.
//

public import Dependencies
public import DependencyContainer
import FavoritePokemonListScreen
import Router
import SwiftUI

extension FavoritePokemonListViewContainer: @retroactive DependencyKey {

    public static var liveValue: Self {
        .init { router, input, trigger in
            AnyView(
                FavoritePokemonListView(router: router as! Router, input: input, trigger: trigger)
            )
        }
    }
}

