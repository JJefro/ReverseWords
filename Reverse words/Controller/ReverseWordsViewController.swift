//
//  ReverseWordsViewController.swift
//  Reverse words
//
//  Created by Jevgenijs Jefrosinins on 25/08/2021.
//

import UIKit

class ReverseWordsViewController: UIViewController {
    
    @IBOutlet weak var topTextField: CustomTextField!
    @IBOutlet weak var bottomTextField: CustomTextField!
    @IBOutlet weak var resultButton: Button!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var model = ReverseWordsModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        resultLabel.text?.removeAll()
        resultLabel.accessibilityIdentifier = Accessibility.label.identifier
        
        // UITexfield settings
        topTextField.makeLineConstraints()
        topTextField.delegate = self
        topTextField.returnKeyType = .done
        
        bottomTextField.makeLineConstraints()
        bottomTextField.delegate = self
        bottomTextField.returnKeyType = .done
        bottomTextField.isHidden = true
    }
    
    @IBAction func buttonPressed(_ sender: Button) {
        guard let text = topTextField.text else {return}
        guard let result = resultLabel.text else {return}
        if resultButton.isEnabled, result.isEmpty {
            resultLabel.text = model.reverse(string: text)
            
            topTextField.isEnabled = false
            
            resultButton.setTitle(ButtonTitle.clear.title, for: .normal)
        } else {
            resultLabel.text?.removeAll()
            topTextField.text?.removeAll()
            bottomTextField.text?.removeAll()
            
            topTextField.isEnabled = true
            bottomTextField.isEnabled = false
            resultButton.isEnabled = false
            
            resultButton.setTitle(ButtonTitle.reverse.title, for: .normal)
        }
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        resultButton.setTitle(ButtonTitle.reverse.title, for: .normal)
        resultLabel.text?.removeAll()
        switch sender.selectedSegmentIndex {
        case 0:
            model.settings = .defaultSettings
            bottomTextField.isHidden = true
            descriptionLabel.isHidden = false
            resultButton.isHidden = false
        case 1:
            model.settings = .customSettings
            bottomTextField.isHidden = false
            descriptionLabel.isHidden = true
            resultButton.isHidden = false
        case 2:
            model.settings = .extraSettings
            resultButton.isHidden = true
        default:
            break
        }
    }
    
    @IBAction func editingChanged(_ sender: CustomTextField) {
        resultButton.isEnabled = true
    }
}
