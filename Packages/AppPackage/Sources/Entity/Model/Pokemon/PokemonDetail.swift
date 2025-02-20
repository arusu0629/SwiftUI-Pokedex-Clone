//
//  PokemonDetail.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/04.
//

import Foundation

// MARK: - PokemonDetail
@DebugDescription
public struct PokemonDetail: Sendable {

    public let number: Int

    public let name: String

    public let imageUrl: URL?

    public let subImageUrl: URL?

    public let typeHex: String

    public let information: Information

    public let status: [PokemonStatus]

    public init(
        number: Int,
        name: String,
        typeHex: String,
        information: Information,
        status: [PokemonStatus]
    ) {
        self.number = number
        self.name = name
        imageUrl = PokemonImageURLGenerator.generateImageURL(from: number)
        subImageUrl = PokemonImageURLGenerator.generateSubImageURL(from: number)
        self.typeHex = typeHex
        self.information = information
        self.status = status
    }
}

// MARK: - DebugDescription
extension PokemonDetail {

    public var debugDescription: String {
        """
        name: \(name)
        number: \(number)
        imageUrl: \(String(describing: imageUrl ?? nil))
        subImageUrl: \(String(describing: subImageUrl ?? nil))
        typeHex: \(typeHex)
        information: \(information.infoTypes.map(\.id))
        status: \(status.map(\.id))
        """
    }
}

// MARK: - PokemonDetail.Information
extension PokemonDetail {

    public struct Information: Sendable, Hashable {

        public let infoTypes: [InfoType]

        public init(infoTypes: [InfoType]) {
            self.infoTypes = infoTypes
        }
    }
}

// MARK: - PokemonDetail.Information.InfoType
extension PokemonDetail.Information {

    public enum InfoType: Sendable, Hashable, Identifiable {
        case pokemonTypes([PokemonType])
        case height(Float)
        case weight(Float)
        case firstAbility(String)
        case secondAbility(String?)
        case hiddenAbility(String?)

        public var id: String {
            switch self {
            case let .pokemonTypes(types):
                "pokemonTypes-\(types)"
            case let .height(height):
                "height-\(height)"
            case let .weight(weight):
                "weight-\(weight)"
            case let .firstAbility(ability):
                "firstAbility-\(ability)"
            case let .secondAbility(ability):
                "secondAbility-\(ability ?? "")"
            case let .hiddenAbility(ability):
                "hiddenAbility-\(ability ?? "")"
            }
        }
    }
}

#if DEBUG
extension PokemonDetail {

    public static var mock: Self {
        .init(
            number: 1,
            name: "mock",
            typeHex: "mock",
            information: .init(infoTypes: []),
            status: []
        )
    }
}
#endif
