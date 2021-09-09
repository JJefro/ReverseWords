//
//  ReverseWordsUIModel.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 03/09/2021.
//

import UIKit

struct ReverseWordsUIModel {
    
    private let service = ReverseWordsService()
    
    var textFieldIsActive = false

    func reverseWords(label: UILabel, textField: CustomTextField, button: Button) {
        guard let text = textField.text else {fatalError()}
        guard let result = label.text else {fatalError()}
        if button.isEnabled, result.isEmpty {
            
            label.text = service.reverse(string: text)
            
            textField.isEnabled = false
            
            button.setTitle(ButtonTitle.clear.title, for: .normal)
        } else {
            label.text?.removeAll()
            
            textField.text?.removeAll()
            textField.isEnabled = true
            
            button.setTitle(ButtonTitle.reverse.title, for: .normal)
            button.isEnabled = false
        }
    }
    
    func changeLineAttribute(textField: CustomTextField) {
        if textFieldIsActive {
            textField.bottomLine.backgroundColor = #colorLiteral(red: 0, green: 0.5694751143, blue: 1, alpha: 1)
        } else {
            textField.bottomLine.backgroundColor = #colorLiteral(red: 0.6321569085, green: 0.6321569085, blue: 0.6321569085, alpha: 1)
        }
    }
    
    func editingChanged(button: Button) {
        button.isEnabled = true
        button.alpha = 1
    }
}
