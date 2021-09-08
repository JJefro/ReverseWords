//
//  ReverseWordsService.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 03/09/2021.
//

import UIKit

struct ReverseWordsService {

    func reverseWords(label: UILabel, textField: CustomTextField, button: Button) {
        guard let text = textField.text else {fatalError()}
        guard let result = label.text else {fatalError()}
        if button.isEnabled, result.isEmpty {
            
            label.text = reverse(string: text)
            
            textField.bottomGrayLine.isHidden = false
            textField.bottomBlueLine.isHidden = true
            textField.isEnabled = false
            
            button.setTitle(ButtonTitle.clear.title, for: .normal)
    
        } else {
            label.text?.removeAll()
            
            textField.text?.removeAll()
            textField.bottomGrayLine.isHidden = true
            textField.isEnabled = true
            
            button.setTitle(ButtonTitle.reverse.title, for: .normal)
            button.isEnabled = false
            button.alpha = 0.5
        }
    }
    
    func editingChanged(button: Button, textField: CustomTextField) {
        button.isEnabled = true
        button.alpha = 1
        
        textField.bottomBlueLine.isHidden = false
    }
    
    func reverse(string: String) -> String {
        return String(string.split(separator: " ").map{ $0.reversed()}.joined(separator: " "))
    }
}


