//
//  Array+.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/04.
//

import Foundation

extension Array {

    public func chunked(into size: Int) -> [[Element]] {
        var chunks: [[Element]] = []
        var currentIndex = 0
        while currentIndex < self.count {
            let endIndex = Swift.min(currentIndex + size, self.count)
            chunks.append(Array(self[currentIndex..<endIndex]))
            currentIndex = endIndex
        }
        return chunks
    }
}
