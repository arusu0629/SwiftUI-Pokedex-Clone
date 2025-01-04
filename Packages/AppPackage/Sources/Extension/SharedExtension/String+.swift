//
//  String+.swift
//  AppPackage
//
//  Created by af_nakandakari_toru on 2025/01/04.
//

import Foundation

extension String {

    public func initialLetterUppercased() -> Self {
        prefix(1).uppercased() + dropFirst()
    }
}
