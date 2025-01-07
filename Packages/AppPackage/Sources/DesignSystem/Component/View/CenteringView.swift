//
//  CenteringView.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/07.
//

import SwiftUI

public struct CenteringView<Content: View>: View {

    let content: () -> Content

    public var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                content()
                Spacer()
            }
            Spacer()
        }
    }
}
