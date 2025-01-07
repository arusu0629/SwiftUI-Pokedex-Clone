//
//  TabDoubleTapTrigger.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/07.
//

import Foundation

public struct TabDoubleTapTrigger: Equatable, Hashable {

    public private(set) var key: Bool = false

    public init() {}

    public mutating func fire() {
        key.toggle()
    }
}
