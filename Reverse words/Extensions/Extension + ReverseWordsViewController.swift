//
//  Extension + ReverseWordsViewController.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 13/09/2021.
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

extension ReverseWordsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
}
