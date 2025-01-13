//
//  GetFavoritePokemonUseCase.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/11.
//

import Dependencies
import Entity
import Foundation
private import SwiftDataWrapper

// MARK: - GetFavoritePokemonUseCase
public struct GetFavoritePokemonUseCase: Sendable {

    @Dependency(\.pokemonSwiftDataWrapperContainer) private var pokemonSwiftDataWrapperContainer

    public func execute(_ number: Int) async throws(ApplicationError) -> FavorablePokemon? {
        try await pokemonSwiftDataWrapperContainer
            .container()
            .readFavoritePokemon(number)
    }
}

// MARK: - DependencyKey
extension GetFavoritePokemonUseCase: DependencyKey {

    public static var liveValue: Self {
        GetFavoritePokemonUseCase()
    }
}

extension DependencyValues {

    public var getFavoritePokemonUseCase: GetFavoritePokemonUseCase {
        get { self[GetFavoritePokemonUseCase.self] }
        set { self[GetFavoritePokemonUseCase.self] = newValue }
    }
}
