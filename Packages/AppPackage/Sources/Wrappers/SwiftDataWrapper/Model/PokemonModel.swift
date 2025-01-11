//
//  PokemonModel.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/11.
//

import Foundation
import SwiftData

@Model
final class PokemonModel: Hashable {

    @Attribute(.unique) var number: Int

    var name: String

    var imageUrl: URL?

    var subImageUrl: URL?

    var isFavorite: Bool

    init(
        number: Int,
        name: String,
        imageUrl: URL?,
        subImageUrl: URL?,
        isFavorite: Bool
    ) {
        self.number = number
        self.name = name
        self.imageUrl = imageUrl
        self.subImageUrl = subImageUrl
        self.isFavorite = isFavorite
    }
}
