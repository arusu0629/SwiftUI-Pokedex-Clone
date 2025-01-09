//
//  PokemonDetailViewContainer+DependencyKey.swift
//  SwiftUI-Pokedex-Clone
//
//  Created by af_nakandakari_toru on 2025/01/09.
//

public import Dependencies
public import DependencyContainer
import PokemonDetailScreen
import Router
import SwiftUI

extension PokemonDetailViewContainer: @retroactive DependencyKey {

    public static var liveValue: Self {
        .init { router, input, pokemonNumber in
            AnyView(
                PokemonDetailView(
                    router: router as! Router,
                    input: input,
                    pokemonNumber: pokemonNumber
                )
            )
        }
    }
}
