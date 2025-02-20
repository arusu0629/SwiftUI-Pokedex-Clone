//
//  PokemonSwiftDataWrapper.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/11.
//

import Entity
import SwiftData
import SwiftUI

// MARK: - PokemonSwiftDataWrapper
@SwiftDataActor
public final class PokemonSwiftDataWrapper: Sendable {

    let container: ModelContainer

    public init(useInMemoryStore: Bool = false) {
        do {
            let config = ModelConfiguration(for: PokemonModel.self, isStoredInMemoryOnly: useInMemoryStore)
            container = try ModelContainer(for: PokemonModel.self, configurations: config)
        } catch {
            fatalError("ModelContainer initialization failed")
        }
    }
}

// MARK: - Write
extension PokemonSwiftDataWrapper {

    public func writePokemon(
        _ data: FavorablePokemon
    ) async throws(ApplicationError) {
        let data = await PokemonModel(
            number: data.number,
            name: data.name,
            imageUrl: data.imageUrl,
            subImageUrl: data.subImageUrl,
            isFavorite: data.isFavorite
        )

        let context = ModelContext(container)
        context.insert(data)
        do {
            try context.save()
        } catch {
            throw ApplicationError.database(.write(error))
        }
    }
}

// MARK: - Read
extension PokemonSwiftDataWrapper {

    public func readAllFavoritePokemon() async throws(ApplicationError) -> [FavorablePokemon] {
        do {
            let context = ModelContext(container)
            let predicate = #Predicate<PokemonModel> { $0.isFavorite }
            let models = try context.fetch(FetchDescriptor<PokemonModel>(
                predicate: predicate,
                sortBy: [SortDescriptor(\.number)])
            )
            return models.map(convert)
        } catch {
            throw ApplicationError.database(.read(error))
        }
    }

    public func readFavoritePokemon(_ number: Int) async throws(ApplicationError) -> FavorablePokemon? {
        do {
            let context = ModelContext(container)
            let predicate = #Predicate<PokemonModel> { $0.isFavorite && $0.number == number }
            let fetchDescriptor = FetchDescriptor<PokemonModel>(predicate: predicate)
            let models = try context.fetch(fetchDescriptor)
            return models.first.map(convert)
        } catch {
            throw ApplicationError.database(.read(error))
        }
    }
}

// MARK: - Private
extension PokemonSwiftDataWrapper {

    private func convert(_ model: PokemonModel) -> FavorablePokemon {
        .init(
            name: model.name,
            number: model.number,
            imageUrl: model.imageUrl,
            subImageUrl: model.subImageUrl,
            isFavorite: model.isFavorite
        )
    }
}

#if DEBUG
extension PokemonSwiftDataWrapper {

    func reset() throws {
        let context = ModelContext(container)
        try context.delete(model: PokemonModel.self)
    }
}
#endif
