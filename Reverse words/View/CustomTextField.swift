//
//  CustomTextField.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 27/08/2021.
//

import UIKit

class CustomTextField: UITextField {
    
    let bottomBlueLine = CALayer()
    let bottomGrayLine = CALayer()
    
    private let screenWidth = UIScreen.main.bounds.width
    
    func setup() {
        bottomBlueLine.frame = CGRect(x: 0, y: self.frame.height + 19, width: screenWidth - 32, height: 2)
        bottomBlueLine.backgroundColor = #colorLiteral(red: 0, green: 0.5694751143, blue: 1, alpha: 1)
        
        bottomGrayLine.frame = bottomBlueLine.frame
        bottomGrayLine.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        
        //Remove borders
        self.borderStyle = .none
        
        //Add layers to UITextField sublayer
        self.layer.addSublayer(bottomGrayLine)
        self.layer.addSublayer(bottomBlueLine)
        
        //Hide lines
        bottomGrayLine.isHidden = true
        bottomBlueLine.isHidden = true
        
        self.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
    }
}

extension CustomTextField {
    @objc func myTargetFunction(textField: CustomTextField) {
        self.bottomBlueLine.isHidden = false
    }
}
