//
//  Button.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 27/08/2021.
//

import UIKit

class Button: UIButton {
    
    let ID = Accessibility.button.identifier
    
    func setup() {
        self.setTitle("Reverse", for: .normal)
        self.layer.cornerRadius = 14
        self.clipsToBounds = true
        self.backgroundColor = #colorLiteral(red: 0, green: 0.5694751143, blue: 1, alpha: 1)
        
        self.isEnabled = false
        self.alpha = 0.5
        
        self.accessibilityIdentifier = ID
    }
}
