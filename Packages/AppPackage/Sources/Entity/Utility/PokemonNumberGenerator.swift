//
//  PokemonNumberGenerator.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/02.
//

import Foundation

enum PokemonNumberGenerator {

    static func generate(from url: String) -> Int? {
        guard !url.isEmpty,
              let number = generate(fromPokemon: url) else {
            return nil
        }
        return number
    }

    private static func generate(fromPokemon url: String) -> Int? {
        var removePrefix = url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
        removePrefix.removeLast()
        return Int(removePrefix)
    }
}
