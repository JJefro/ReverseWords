//
//  Extension + String.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 17/09/2021.
//

import Foundation

extension String {

    subscript (index: Int) -> String.Element {
        let stringIndex = self.index(self.startIndex, offsetBy: index)
        return self[stringIndex]
    }
}
