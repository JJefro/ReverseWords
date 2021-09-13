//
//  ReverseWordsViewController.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 25/08/2021.
//

import UIKit

class ReverseWordsViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var customTextField: CustomTextField!
    @IBOutlet weak var textField2: CustomTextField!
    @IBOutlet weak var button: Button!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private let model = ReverseWordsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        // UITexfield settings
        customTextField.delegate = self
        customTextField.returnKeyType = .done
        textField2.delegate = self
        textField2.returnKeyType = .done
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        resultLabel.accessibilityIdentifier = Accessibility.label.identifier
        resultLabel.text?.removeAll()
        textField2.isHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        customTextField.makeLineConstraints()
        textField2.makeLineConstraints()
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
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        secondLabel.isHidden.toggle()
        textField2.isHidden.toggle()
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        resultLabel.text = textField2.text
        return true
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
}
