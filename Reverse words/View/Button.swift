//
//  Button.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 27/08/2021.
//

import UIKit

class Button: CardButton {

    @IBInspectable var isReverseTitle: Bool = true {
        didSet {
            if isReverseTitle {
                self.setTitle(ButtonTitle.reverse.title, for: .normal)
            } else {
                self.setTitle(ButtonTitle.clear.title, for: .normal)
            }
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: { [self] in
                alpha = isEnabled ? 1 : 0.5
            }, completion: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        isEnabled = false

        setTitle(ButtonTitle.reverse.title, for: .normal)
        layer.cornerRadius = 14
        clipsToBounds = true

        accessibilityIdentifier = Accessibility.resultButton.identifier
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
