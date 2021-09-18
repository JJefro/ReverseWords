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

        // Accessibility identifiers
        resultLabel.accessibilityIdentifier = Accessibility.resultLabel.identifier
        topTextField.accessibilityIdentifier = Accessibility.topTextField.identifier
        bottomTextField.accessibilityIdentifier = Accessibility.bottomTextField.identifier
        segmentedControl.accessibilityIdentifier = Accessibility.segmentedControl.identifier

        // UITexfield settings
        topTextField.makeLineConstraints()
        topTextField.delegate = self
        topTextField.returnKeyType = .default

        bottomTextField.makeLineConstraints()
        bottomTextField.delegate = self
        bottomTextField.returnKeyType = .default
        bottomTextField.isHidden = true
    }
    
    @IBAction func buttonPressed(_ sender: Button) {
        guard let text = topTextField.text else {return}
        if resultButton.isEnabled, resultButton.isReverseTitle, model.settings != .extraSettings {

            resultLabel.text = model.reverse(string: text)
            topTextField.isEnabled = false
            bottomTextField.isEnabled = false
            resultButton.isReverseTitle = false
        } else {
            resultLabel.text?.removeAll()
            topTextField.text?.removeAll()
            bottomTextField.text?.removeAll()

            topTextField.isEnabled = true
            bottomTextField.isEnabled = true
            resultButton.isEnabled = false
            if model.settings != .extraSettings {
                resultButton.isReverseTitle = true
            } else {
                resultButton.isReverseTitle = false
            }
        }
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        resultLabel.text?.removeAll()
        switch sender.selectedSegmentIndex {
        case 0:
            model.settings = .defaultSettings
            bottomTextField.isHidden = true
            descriptionLabel.isHidden = false
            resultButton.isReverseTitle = true
        case 1:
            model.settings = .customSettings
            bottomTextField.isHidden = false
            descriptionLabel.isHidden = true
            resultButton.isReverseTitle = true
        case 2:
            model.settings = .extraSettings
            descriptionLabel.isHidden = true
            bottomTextField.isHidden = false
            resultButton.isReverseTitle = false
            updateResultLabel()
        default:
            break
        }
    }

    @IBAction func topTextFieldEditingChanged(_ sender: CustomTextField) {
        resultButton.isEnabled = true
        if model.settings == .extraSettings {
            updateResultLabel()
        }
    }

    @IBAction func bottomTextFieldEditingChanged(_ sender: CustomTextField) {
        guard let text = bottomTextField.text else {return}
        model.exceptionElements = text
        if model.settings == .extraSettings {
            updateResultLabel()
        } else {
            resultButton.isReverseTitle = true
        }
    }

    private func updateResultLabel() {
        guard let text = topTextField.text else {return}
        resultLabel.text = model.reverse(string: text)
    }
}
