//
//  Accessibility.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 07/09/2021.
//

import Foundation

enum Accessibility {
    case button
    case textField
    case label
    
    var identifier: String {
        switch self {
        case .button:
            return "button"
        case .textField:
            return "textField"
        case .label:
            return "label"
        }
    }
}
