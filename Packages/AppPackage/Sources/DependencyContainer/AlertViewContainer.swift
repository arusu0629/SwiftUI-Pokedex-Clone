//
//  AlertViewContainer.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/13.
//

import Dependencies
import Entity
import RouterCore
import SwiftUI

// MARK: - AlertViewContainer
public struct AlertViewContainer: Sendable {

    public var view: @MainActor @Sendable (
        _ router: BaseRouter,
        _ input: CommonScreenInput,
        _ error: ApplicationError,
        _ buttons: [AlertButtonType]
    ) -> AnyView

    public init(
        view: @escaping @MainActor @Sendable (
            _ router: BaseRouter,
            _ input: CommonScreenInput,
            _ error: ApplicationError,
            _ buttons: [AlertButtonType]
        ) -> AnyView
    ) {
        self.view = view
    }
}

// MARK: - TestDependencyKey
extension AlertViewContainer: TestDependencyKey {

    public static var testValue: Self {
        .init(view: unimplemented("", placeholder: AnyView(Text("TestValue of AlertView"))))
    }
}

extension DependencyValues {

    public var alertViewContainer: AlertViewContainer {
        get { self[AlertViewContainer.self] }
        set { self[AlertViewContainer.self] = newValue }
    }
}
