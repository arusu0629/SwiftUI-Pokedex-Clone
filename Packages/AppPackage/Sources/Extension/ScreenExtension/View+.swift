//
//  View+.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/07.
//

import Entity
import SwiftUI

extension View {

    public func hidden(_ hidden: Bool) -> some View {
        hidden ? nil : self
    }

    @ViewBuilder
    public func when(
        _ condition: Bool,
        @ViewBuilder transform: (Self) -> some View
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

extension View {

    public func onTrigger(
        of trigger: TabDoubleTapTrigger?,
        perform: @escaping () -> Void
    ) -> some View {
        onChange(of: trigger) { _, _ in
            perform()
        }
    }
}
