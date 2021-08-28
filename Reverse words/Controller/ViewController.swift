//
//  ViewController.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 25/08/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField: CustomTextField!
    
    @IBOutlet weak var button: Button!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    private let buttonTitle1 = "Reverse"
    private let buttonTitle2 = "Clear"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UITexfield settings
        textField.setup()
        
        //Button settings
        button.setup()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let text = textField.text else {fatalError()}
        guard let result = resultLabel.text else {fatalError()}
        if button.isEnabled, result.isEmpty {
            
            resultLabel.text = reverse(string: text)
            textField.bottomGrayLine.isHidden = false
            textField.bottomBlueLine.isHidden = true
            
            self.button.setTitle(buttonTitle2, for: .normal)
            
        } else {
            resultLabel.text?.removeAll()
            textField.text?.removeAll()
            
            textField.bottomGrayLine.isHidden = true
            
            self.button.setTitle(buttonTitle1, for: .normal)
            button.isEnabled = false
            button.backgroundColor = #colorLiteral(red: 0, green: 0.5694751143, blue: 1, alpha: 0.5)
        }
    }
    
    private func reverse(string: String) -> String {
        return String(string.split(separator: " ").map{ $0.reversed()}.joined(separator: " "))
    }
    
    @IBAction func editingChanged(_ sender: CustomTextField) {
        
        button.isEnabled = true
        button.backgroundColor = #colorLiteral(red: 0, green: 0.5694751143, blue: 1, alpha: 1)
        
        textField.bottomBlueLine.isHidden = false
    }
}


