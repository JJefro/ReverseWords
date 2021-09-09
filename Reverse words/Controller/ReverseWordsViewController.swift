//
//  ReverseWordsViewController.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 25/08/2021.
//

import UIKit

class ReverseWordsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: CustomTextField!
    @IBOutlet weak var button: Button!
    @IBOutlet weak var resultLabel: UILabel!
    
    private let model = ReverseWordsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.accessibilityIdentifier = Accessibility.label.identifier
        
        //UITexfield settings
        textField.setup()
        textField.delegate = self
        textField.returnKeyType = .done
        
        //Button settings
        button.setup()
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        model.reverseWords(label: resultLabel, textField: textField, button: button)
    }
    @IBAction func editingChanged(_ sender: CustomTextField) {
        model.editingChanged(button: button, textField: textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        buttonPressed(button)
        return true
    }
}


