//
//  GetAllFavoritePokemonUseCase.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/11.
//

import Dependencies
import Entity
import Foundation
private import SwiftDataWrapper

public struct GetAllFavoritePokemonUseCase: Sendable {

    @Dependency(\.pokemonSwiftDataWrapperContainer) private var pokemonSwiftDataWrapperContainer

    public func execute() async throws(ApplicationError) -> [FavorablePokemon] {
        try await pokemonSwiftDataWrapperContainer
            .container()
            .readAllFavoritePokemon()
    }
}

// MARK: - DependencyKey
extension GetAllFavoritePokemonUseCase: DependencyKey {

    public static var liveValue: Self {
        GetAllFavoritePokemonUseCase()
    }
}

extension DependencyValues {

    public var getAllFavoritePokemonUseCase: GetAllFavoritePokemonUseCase {
        get { self[GetAllFavoritePokemonUseCase.self] }
        set { self[GetAllFavoritePokemonUseCase.self] = newValue }
    }
}
