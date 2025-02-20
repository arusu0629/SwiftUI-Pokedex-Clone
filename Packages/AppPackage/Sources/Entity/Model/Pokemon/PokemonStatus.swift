//
//  PokemonStatus.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/04.
//

import Foundation

// MARK: - PokemonStatus
public struct PokemonStatus: Sendable, Identifiable, Hashable {

    public var id: String {
        "\(type.rawValue)-\(value)"
    }

    public let type: `Type`

    public let value: Int

    public init?(name: String, value: Int) {
        guard let type = Type(rawValue: name) else {
            return nil
        }
        self.type = type
        self.value = value
    }
}

// MARK: - PokemonStatus.`Type`
extension PokemonStatus {

    public enum `Type`: String, Sendable {
        case hp
        case attack
        case defense
        case specialAttack
        case specialDefense
        case speed

        public init?(rawValue: String) {
            switch rawValue {
            case "hp":
                self = .hp
            case "attack":
                self = .attack
            case "defense":
                self = .defense
            case "special-attack":
                self = .specialAttack
            case "special-defense":
                self = .specialDefense
            case "speed":
                self = .speed
            default:
                return nil
            }
        }

        public var title: String {
            switch self {
            case .hp:
                "HP"
            case .attack:
                "Attack"
            case .defense:
                "Defense"
            case .specialAttack:
                "SpecialAttack"
            case .specialDefense:
                "SpecialDefense"
            case .speed:
                "Speed"
            }
        }

        public var priority: Int {
            switch self {
            case .hp:
                0
            case .attack:
                1
            case .defense:
                2
            case .specialAttack:
                3
            case .specialDefense:
                4
            case .speed:
                5
            }
        }

    }
}
