//
//  RootViewContainer.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/08.
//

import Dependencies
import Entity
import RouterCore
import SwiftUI

// MARK: - RootViewContainer
public struct RootViewContainer: Sendable {

    public var view: @MainActor @Sendable (
        _ router: BaseRouter,
        _ input: CommonScreenInput
    ) -> AnyView

    public init(
        view: @escaping @MainActor @Sendable (
            _ router: BaseRouter,
            _ input: CommonScreenInput
        ) -> AnyView
    ) {
        self.view = view
    }
}

// MARK: - TestDependencyKey
extension RootViewContainer: TestDependencyKey {

    public static var testValue: Self {
        .init(view: unimplemented("", placeholder: AnyView(Text("TestValue of RootView"))))
    }
}

extension DependencyValues {

    public var rootViewContainer: RootViewContainer {
        get { self[RootViewContainer.self] }
        set { self[RootViewContainer.self] = newValue }
    }
}
