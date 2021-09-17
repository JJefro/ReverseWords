//
//  Accessibility.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 07/09/2021.
//

import Foundation

enum Accessibility {
    case resultButton
    case topTextField
    case bottomTextField
    case resultLabel
    case segmentedControl

    var identifier: String {
        switch self {
        case .resultButton:
            return "resultButton"
        case .topTextField:
            return "topTextField"
        case .bottomTextField:
            return "bottomTextField"
        case .resultLabel:
            return "result"
        case .segmentedControl:
            return "segmentedControl"
        }
    }
}
