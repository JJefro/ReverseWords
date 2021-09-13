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
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private let model = ReverseWordsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        // UITexfield settings
        topTextField.delegate = self
        bottomTextField.delegate = self
        
        topTextField.returnKeyType = .done
        bottomTextField.returnKeyType = .done
    }
    
    override func viewWillLayoutSubviews() {
        topTextField.makeLineConstraints()
        bottomTextField.makeLineConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        resultLabel.accessibilityIdentifier = Accessibility.label.identifier
        resultLabel.text?.removeAll()
        bottomTextField.isHidden = true
    }
    
    @IBAction func buttonPressed(_ sender: Button) {
        guard let text = topTextField.text else {fatalError()}
        guard let result = resultLabel.text else {fatalError()}
        if resultButton.isEnabled, result.isEmpty {
            resultLabel.text = model.reverse(string: text)
            
            topTextField.isEnabled = false
            
            resultButton.setTitle(ButtonTitle.clear.title, for: .normal)
        } else {
            resultLabel.text?.removeAll()
            topTextField.text?.removeAll()
            
            topTextField.isEnabled = true
            
            resultButton.setTitle(ButtonTitle.reverse.title, for: .normal)
            resultButton.isEnabled = false
        }
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        bottomLabel.isHidden.toggle()
        bottomTextField.isHidden.toggle()
    }
    
    @IBAction func editingChanged(_ sender: CustomTextField) {
        resultButton.isEnabled = true
    }
}
