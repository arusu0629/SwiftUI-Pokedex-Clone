//
//  FontWithLineHeight.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/07.
//

import SwiftUI

// MARK: - FontWithLineHeight
public struct FontWithLineHeight: ViewModifier {
    public let font: UIFont
    public let lineHeight: CGFloat

    public func body(content: Content) -> some View {
        content
            .font(Font(font))
            .lineSpacing(lineHeight - font.lineHeight)
            .padding(.vertical, (lineHeight - font.lineHeight) / 2)
    }
}

extension Text {

    public func fontWithLineHeight(token: TypographyToken) -> some View {
        ModifiedContent(
            content: self,
            modifier: FontWithLineHeight(
                font: token.uiFont,
                lineHeight: token.lineHeight
            )
        )
    }
}
