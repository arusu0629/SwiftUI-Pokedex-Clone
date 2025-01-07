//
//  RootTab.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/07.
//

import Foundation

public enum RootTab: Int, CaseIterable {
    case pokemonList = 0
    case favrotiePokemonList

    public var navigationTitle: String {
        switch self {
        case .pokemonList:
            "Pokedex"
        case .favrotiePokemonList:
            "Favorites"
        }
    }
}
