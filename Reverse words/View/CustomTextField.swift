//
//  CustomTextField.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 27/08/2021.
//

import UIKit
import SnapKit

class CustomTextField: UITextField {
    
    let bottomLine = UIView()
    
    private let lineHeight = 2
    private let lineTopConstraints = 41
    
    func setup() {
        makeLineConstraints()
        
        // Remove borders
        self.borderStyle = .none
        
        bottomLine.backgroundColor = #colorLiteral(red: 0.6321569085, green: 0.6321569085, blue: 0.6321569085, alpha: 1)
        
        self.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
        self.accessibilityIdentifier = Accessibility.textField.identifier
    }
    
    private func makeLineConstraints() {
        superview?.addSubview(bottomLine)
        
        bottomLine.snp.makeConstraints { make in
            make.height.equalTo(lineHeight)
            make.top.equalTo(self).inset(lineTopConstraints)
            make.leading.trailing.equalToSuperview()
        }
    }
}
