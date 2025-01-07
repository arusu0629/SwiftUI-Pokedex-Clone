//
//  PokemonListViewContainer.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/07.
//

import Dependencies
import Entity
import RouterCore
import SwiftUI

// MARK: - PokemonListViewContainer
public struct PokemonListViewContainer: Sendable {

    public var view: @MainActor @Sendable (
        _ router: BaseRouter,
        _ input: CommonScreenInput,
        _ trigger: TabDoubleTapTrigger?
    ) -> AnyView

    public init(
        view: @escaping @MainActor @Sendable (
            _ router: BaseRouter,
            _ input: CommonScreenInput,
            _ trigger: TabDoubleTapTrigger?
        ) -> AnyView
    ) {
        self.view = view
    }
}

// MARK: - TestDependencyKey
extension PokemonListViewContainer: TestDependencyKey {

    public static var testValue: Self {
        .init(view: unimplemented("", placeholder: AnyView(Text("TestValue of PokemonListView"))))
    }
}

extension DependencyValues {
    public var pokemonListViewContainer: PokemonListViewContainer {
        get { self[PokemonListViewContainer.self] }
        set { self[PokemonListViewContainer.self] = newValue }
    }
}
