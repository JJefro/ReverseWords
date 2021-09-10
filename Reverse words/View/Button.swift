//
//  Button.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 27/08/2021.
//

import UIKit

class Button: CardButtonStyle {
    
    override var isEnabled: Bool {
        didSet {
            UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: { [self] in
                alpha = isEnabled ? 1 : 0.5
            }, completion: nil)
        }
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setTitle(ButtonTitle.reverse.title, for: .normal)
        layer.cornerRadius = 14
        clipsToBounds = true
        isEnabled = false

        accessibilityIdentifier = Accessibility.button.identifier
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
