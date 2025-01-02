//
//  Item.swift
//  SwiftUI-Pokedex-Clone
//
//  Created by af_nakandakari_toru on 2025/01/02.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
