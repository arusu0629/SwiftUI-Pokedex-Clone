//
//  SaveFavoritePokemonUseCase.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/11.
//

import Dependencies
import Entity
import Foundation
private import SwiftDataWrapper

// MARK: - SaveFavoritePokemonUseCase
public struct SaveFavoritePokemonUseCase: Sendable {

    @Dependency(\.pokemonSwiftDataWrapperContainer) private var pokemonSwiftDataWrapperContainer

    public func execute(_ pokemon: FavorablePokemon) async throws(ApplicationError) {
        try await pokemonSwiftDataWrapperContainer.container().writePokemon(pokemon)
    }
}

// MARK: - DependencyKey
extension SaveFavoritePokemonUseCase: DependencyKey {

    public static var liveValue: Self {
        SaveFavoritePokemonUseCase()
    }
}

extension DependencyValues {

    public var saveFavoritePokemonUseCase: SaveFavoritePokemonUseCase {
        get { self[SaveFavoritePokemonUseCase.self] }
        set { self[SaveFavoritePokemonUseCase.self] = newValue }
    }
}
