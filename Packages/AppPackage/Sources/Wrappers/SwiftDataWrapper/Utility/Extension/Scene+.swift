//
//  Scene+.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/11.
//

import SwiftData
import SwiftUI

extension Scene {

    public func setupSwiftData() -> some Scene {
        modelContainer(for: [PokemonModel.self])
    }
}
