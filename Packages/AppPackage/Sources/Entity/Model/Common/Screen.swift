//
//  Screen.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/07.
//

import Foundation

// MARK: - Screen
public enum Screen: Equatable, Hashable {
    case root
    // TODO: case alert(error: ApplicationError, buttons: [AlertButtonType])
    case pokemonList
    case pokemonDetail(number: Int)
    case favoritePokemonList
}

// MARK: - Identifiable
extension Screen: Identifiable {

    public var id: Self { self }
}
