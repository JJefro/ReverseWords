//
//  CustomTextField.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 27/08/2021.
//

import UIKit
import SnapKit

class CustomTextField: UITextField {
    
    let bottomBlueLine = UIView()
    let bottomGrayLine = UIView()
    
    private let screenWidth = UIScreen.main.bounds.width
    
    func setup() {
   
        makeLinesConstraints()
        
        bottomBlueLine.backgroundColor = #colorLiteral(red: 0, green: 0.5694751143, blue: 1, alpha: 1)
        bottomGrayLine.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        
        //Remove borders
        self.borderStyle = .none
        
        //Hide lines
        bottomGrayLine.isHidden = true
        bottomBlueLine.isHidden = true
        
        self.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
    }
    
    private func makeLinesConstraints() {
        superview?.addSubview(bottomBlueLine)
        superview?.addSubview(bottomGrayLine)
        
        bottomBlueLine.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.top.equalTo(self).inset(41)
            make.leading.trailing.equalToSuperview()
        }
        
        bottomGrayLine.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.top.equalTo(self).inset(41)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    
}
