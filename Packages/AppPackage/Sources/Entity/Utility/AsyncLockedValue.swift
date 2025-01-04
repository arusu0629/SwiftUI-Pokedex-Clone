//
//  AsyncLockedValue.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/04.
//

import Foundation

public final actor AsyncLockedValue<T> {
    private var value: T

    public init(initialValue: @autoclosure @Sendable () -> T) {
        value = initialValue()
    }

    public func use(_ action: @Sendable (T) -> Void) {
        action(value)
    }

    public func mutate(_ mutation: @Sendable (inout T) -> Void) {
        mutation(&value)
    }

    public func set(_ value: T) {
        self.value = value
    }

    public func get() -> T {
        value
    }
}
