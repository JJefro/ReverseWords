//
//  ReverseWordsViewController.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 25/08/2021.
//

import UIKit

class ReverseWordsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var customTextField: CustomTextField!
    @IBOutlet weak var button: Button!
    @IBOutlet weak var resultLabel: UILabel!
    
    private var uiModel = ReverseWordsUIModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.accessibilityIdentifier = Accessibility.label.identifier
        
        // UITexfield settings
        customTextField.setup()
        customTextField.delegate = self
        customTextField.returnKeyType = .done
        
        // Button settings
        button.setup()
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        uiModel.reverseWords(label: resultLabel, textField: customTextField, button: button)
    }
    @IBAction func editingChanged(_ sender: CustomTextField) {
        uiModel.editingChanged(button: button)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        uiModel.textFieldIsActive.toggle()
        uiModel.changeLineAttribute(textField: customTextField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        uiModel.textFieldIsActive.toggle()
        uiModel.changeLineAttribute(textField: customTextField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        buttonPressed(button)
        return true
    }
}
