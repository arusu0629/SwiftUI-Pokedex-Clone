//
//  PokeAPIClientWrapper.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/06.
//

import Foundation
import OpenAPIRuntime
private import OpenAPIURLSession
import Dependencies
import Entity
private import SharedExtension

// MARK: - PokeAPIClientWrapper
public struct PokeAPIClientWrapper: Sendable {

    // private let client: any APIProtocol
    private let client: any APIProtocol
}
