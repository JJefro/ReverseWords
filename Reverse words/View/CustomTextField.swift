//
//  CustomTextField.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 27/08/2021.
//

import UIKit
import SnapKit

class CustomTextField: UITextField {
    
    private let bottomLine = UIView()
    
    private let lineHeight = 2
    private let lineTopConstraints = 41
    
    override var isHidden: Bool {
        didSet {
            bottomLine.isHidden = isHidden ? true : false
        }
    }
    
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.6, delay: 0, options: .allowUserInteraction, animations: { [self] in
                bottomLine.backgroundColor = !isSelected ? #colorLiteral(red: 0.6321569085, green: 0.6321569085, blue: 0.6321569085, alpha: 1) : #colorLiteral(red: 0, green: 0.5694751143, blue: 1, alpha: 1)
            }, completion: nil)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        borderStyle = .none
        isSelected = false
        accessibilityIdentifier = Accessibility.textField.identifier
    }
    
    func makeLineConstraints() {
        superview?.addSubview(bottomLine)
    
        bottomLine.snp.makeConstraints { make in
            make.height.equalTo(lineHeight)
            make.top.equalTo(self).inset(lineTopConstraints)
            make.leading.trailing.equalToSuperview()
        }
    }
}
