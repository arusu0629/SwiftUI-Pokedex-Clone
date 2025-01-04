//
//  PokemonAggregate.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/04.
//

import Foundation

// MARK: - PokemonAggregate
public struct PokemonAggregate: Sendable {

    public let totalCount: Int
    public let pokemons: [Pokemon]

    public init(totalCount: Int, pokemons: [Pokemon]) {
        self.totalCount = totalCount
        self.pokemons = pokemons
    }
}

extension PokemonAggregate {

    public static var empty: Self {
        .init(totalCount: 0, pokemons: [])
    }
}
