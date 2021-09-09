//
//  Button.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 27/08/2021.
//

import UIKit

class Button: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1 : 0.5
        }
    }
    
    func setup() {
        self.setTitle(ButtonTitle.reverse.title, for: .normal)
        self.layer.cornerRadius = 14
        self.clipsToBounds = true
        self.backgroundColor = #colorLiteral(red: 0, green: 0.5694751143, blue: 1, alpha: 1)
        
        self.isEnabled = false
        
        self.accessibilityIdentifier = Accessibility.button.identifier
    }
}

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
