//
//  ReverseWordsViewController + UITextFieldDelegate.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 01/10/2021.
//

import UIKit

extension ReverseWordsViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isSelected = true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isSelected = false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
