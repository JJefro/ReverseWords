//
//  ButtonTitle.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 03/09/2021.
//

import UIKit

enum ButtonTitle {
    case reverse
    case clear
    
    var title: String {
        switch self {
        case .reverse:
            return "Reverse"
        case .clear:
            return "Clear"
        }
    }
}
