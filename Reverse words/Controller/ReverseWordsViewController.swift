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
    
    private let model = ReverseWordsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.accessibilityIdentifier = Accessibility.label.identifier
        
        // UITexfield settings
        customTextField.makeLineConstraints()
        customTextField.delegate = self
        customTextField.returnKeyType = .done
    }
    
    @IBAction func buttonPressed(_ sender: Button) {

        guard let text = customTextField.text else {fatalError()}
        guard let result = resultLabel.text else {fatalError()}
        if button.isEnabled, result.isEmpty {
            resultLabel.text = model.reverse(string: text)
            
            customTextField.isEnabled = false
            
            button.setTitle(ButtonTitle.clear.title, for: .normal)
        } else {
            resultLabel.text?.removeAll()
            customTextField.text?.removeAll()
            
            customTextField.isEnabled = true
            
            button.setTitle(ButtonTitle.reverse.title, for: .normal)
            button.isEnabled = false
        }
    }
    
    @IBAction func editingChanged(_ sender: CustomTextField) {
        button.isEnabled = true
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isSelected = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isSelected = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        buttonPressed(button)
        return true
    }
}
