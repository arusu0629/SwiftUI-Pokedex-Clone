//
//  RefreshableScrollView.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/07.
//

import Entity
private import Refreshable
import ScreenExtension
import SwiftUI

// MARK: - RefreshableScrollView
public struct RefreshableScrollView: ViewModifier {

    public let spaceName: String

    public let trigger: TabDoubleTapTrigger?

    public let isCurrent: Binding<Bool>?

    public let onRefresh: () async -> Void

    @State private var executeHaptics: Bool = false

    private var scrollViewId: String {
        "ScroolView-\(spaceName)"
    }

    public func body(content: Content) -> some View {
        ScrollViewReader { proxy in
            ScrollView {
                RefreshControl(coordinateSpace: .named(spaceName)) {
                    Task {
                        executeHaptics.toggle()
                        await onRefresh()
                    }
                }
                .id(scrollViewId)
                content
            }
            .onTrigger(of: trigger) {
                if let isCurrent,
                   isCurrent.wrappedValue {
                    withAnimation {
                        proxy.scrollTo(scrollViewId, anchor: .top)
                    }
                }
            }
            .coordinateSpace(name: spaceName)
            .sensoryFeedback(.impact, trigger: executeHaptics)
        }
    }
}

extension View {

    public func refreshableScrollView(
        spaceName: String,
        trigger: TabDoubleTapTrigger? = nil,
        isCurrent: Binding<Bool>? = nil,
        action: @escaping () async -> Void
    ) -> some View {
        ModifiedContent(
            content: self,
            modifier: RefreshableScrollView(
                spaceName: spaceName,
                trigger: trigger,
                isCurrent: isCurrent,
                onRefresh: action
            )
        )
    }
}
