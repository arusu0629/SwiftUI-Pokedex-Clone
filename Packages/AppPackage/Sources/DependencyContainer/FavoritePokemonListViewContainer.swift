//
//  FavoritePokemonListViewContainer.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/11.
//

import Dependencies
import Entity
import RouterCore
import SwiftUI

public struct FavoritePokemonListViewContainer: Sendable {

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
extension FavoritePokemonListViewContainer: TestDependencyKey {

    public static var testValue: Self {
        .init(view: unimplemented("", placeholder: AnyView(Text("TestValue of FavoritePokemonListView"))))
    }
}

extension DependencyValues {
    public var favoritePokemonListViewContainer: FavoritePokemonListViewContainer {
        get { self[FavoritePokemonListViewContainer.self] }
        set { self[FavoritePokemonListViewContainer.self] = newValue }
    }
}
