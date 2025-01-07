//
//  PokemonListViewLogic.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/07.
//

import Entity
import Foundation

enum PokemonListViewLogic {

    static func makeUniqueAndSorted(
        current: [Pokemon],
        addition: [Pokemon]
    ) -> [Pokemon] {
        var uniquePokemonsDict = Dictionary(uniqueKeysWithValues: current.map { ($0.id, $0) }) // id をキーにしてユニークな辞書を作成

        for pokemon in addition {
            uniquePokemonsDict[pokemon.id] = pokemon
        }

        return uniquePokemonsDict.values.sorted(by: { $0.number < $1.number })
    }
}
