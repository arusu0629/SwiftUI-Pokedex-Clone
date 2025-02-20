//
//  FavoritePokemonListViewState.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/11.
//

import Foundation
private import GetAllFavoritePokemonUseCase
import Observation
private import Dependencies
import Entity
import Logger

@MainActor
@Observable
final class FavoritePokemonListViewState {

    @ObservationIgnored
    @Dependency(\.getAllFavoritePokemonUseCase) private var getAllFavoritePokemonUseCase

    @ObservationIgnored
    @Dependency(\.mainLogger) private var logger

    private(set) var contentId: UUID = .init()

    private(set) var pokemons: [Pokemon] = [] {
        didSet {
            logger.log(.debug, message: "number of pokemons: \(pokemons.count)")
        }
    }

    private(set) var isLoading: Bool = false {
        didSet {
            logger.log(.debug, message: "isLoading: \(isLoading)")
        }
    }

    var shouldShowEmptyView: Bool {
        pokemons.isEmpty && !isLoading
    }

    init() {}

    func getData() async throws(ApplicationError) {
        defer { isLoading = false }
        isLoading = true
        let favorablePokemons = try await getAllFavoritePokemonUseCase.execute()

        pokemons = favorablePokemons.map {
            .init(
                name: $0.name,
                number: $0.number,
                imageUrl: $0.imageUrl,
                subImageUrl: $0.subImageUrl
            )
        }
    }

    func refresh() async throws(ApplicationError) {
        try await getData()
        contentId = .init()
    }
}
