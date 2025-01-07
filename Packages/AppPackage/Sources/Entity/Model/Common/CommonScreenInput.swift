//
//  CommonScreenInput.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/07.
//

import Foundation

public struct CommonScreenInput {

    public let withNavigation: Bool

    public let naviBarLeadingButtonType: ToolbarButtonType?

    public init(
        withNavigation: Bool,
        naviBarLeadingButtonType: ToolbarButtonType?
    ) {
        self.withNavigation = withNavigation
        self.naviBarLeadingButtonType = naviBarLeadingButtonType
    }
}
