//
//  Router.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/07.
//

import Dependencies
import DependencyContainer
import Entity
import RouterCore
import SwiftUI

// MARK: - Router
public final class Router: BaseRouter {

    @Dependency(\.rootViewContainer) private var rootViewContainer
    @Dependency(\.alertViewContainer) private var alertViewContainer
    @Dependency(\.pokemonListViewContainer) private var pokemonListViewContainer
    @Dependency(\.pokemonDetailViewContainer) private var pokemonDetailViewContainer
    @Dependency(\.favoritePokemonListViewContainer) private var favoritePokemonListViewContainer

    public override func view(
        _ screen: Screen,
        transition: ScreenTransition
    ) -> AnyView {
        AnyView(buildView(screen: screen, transition: transition))
    }
}

extension Router {

    @ViewBuilder
    private func buildView( // swiftlint:disable:this function_body_length
        screen: Screen,
        transition: ScreenTransition
    ) -> some View {
        switch screen {
        case .root:
            rootViewContainer.view(
                router(transition: transition),
                CommonScreenInput(
                    withNavigation: transition.withNavigation,
                    naviBarLeadingButtonType: transition.naviBarLeadingButtonType
                )
            )
        case let .alert(error, buttons):
            alertViewContainer.view(
                router(transition: transition),
                CommonScreenInput(
                    withNavigation: transition.withNavigation,
                    naviBarLeadingButtonType: transition.naviBarLeadingButtonType
                ),
                error,
                buttons
            )
        case .pokemonList:
            pokemonListViewContainer.view(
                router(transition: transition),
                CommonScreenInput(
                    withNavigation: transition.withNavigation,
                    naviBarLeadingButtonType: transition.naviBarLeadingButtonType
                ),
                nil
            )
        case let .pokemonDetail(number):
            pokemonDetailViewContainer.view(
                router(transition: transition),
                CommonScreenInput(
                    withNavigation: transition.withNavigation,
                    naviBarLeadingButtonType: transition.naviBarLeadingButtonType
                ),
                number
            )
        case .favoritePokemonList:
            favoritePokemonListViewContainer.view(
                router(transition: transition),
                CommonScreenInput(
                    withNavigation: transition.withNavigation,
                    naviBarLeadingButtonType: transition.naviBarLeadingButtonType
                ),
                nil
            )
        }
    }

    private func router(transition: ScreenTransition) -> Router {
        switch transition {
        case .push,
             .alert:
            self
        case .sheet:
            Router(isPresented: presentingSheet)
        case .fullScreen:
            Router(isPresented: presentingFullScreen)
        }
    }
}

extension Router {

    public func buildTabView(_ tab: RootTab, trigger: TabDoubleTapTrigger?) -> AnyView {
        switch tab {
        case .pokemonList:
            pokemonListViewContainer.view(
                Router(isPresented: .init(.constant(.pokemonList))),
                CommonScreenInput(
                    withNavigation: true,
                    naviBarLeadingButtonType: nil
                ),
                trigger
            )
        case .favoritePokemonList:
            favoritePokemonListViewContainer.view(
                Router(isPresented: .init(.constant(.favoritePokemonList))),
                CommonScreenInput(
                    withNavigation: true,
                    naviBarLeadingButtonType: nil
                ),
                trigger
            )
        }
    }
}
