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

    @Dependency(\.pokemonListViewContainer) private var pokemonListViewContainer

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
        case .pokemonList:
            pokemonListViewContainer.view(
                router(transition: transition),
                CommonScreenInput(
                    withNavigation: transition.withNavigation,
                    naviBarLeadingButtonType: transition.naviBarLeadingButtonType
                ),
                nil
            )
        default:
            // TODO: 他画面対応
            EmptyView()
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
