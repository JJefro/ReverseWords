//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by Jevgenijs Jefrosinins on 03/09/2021.
//

import XCTest
@testable import Reverse_words

class ReverseWordsUITests: XCTestCase {
    
    let accessibilityIdentifier = UITestsAccessibilityIdentifiers()
    
    var app: XCUIApplication!
    var reverseButton: XCUIElement!
    var textField: XCUIElement!
    var resultLabel: XCUIElement!
    var doneButton: XCUIElement!
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()
        
        self.reverseButton = app.buttons[accessibilityIdentifier.reverseButton]
        self.textField = app.textFields[accessibilityIdentifier.textField]
        self.resultLabel = app.staticTexts.element(matching: .any, identifier: accessibilityIdentifier.resultLabel)
        self.doneButton = app.buttons[accessibilityIdentifier.doneButton]
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testThePresenceOfElements() throws {
        XCTAssertTrue(textField.exists)
        XCTAssertTrue(reverseButton.exists)
        textField.tap()
        textField.typeText("Corona")
        XCTAssertTrue(doneButton.exists)
        doneButton.tap()
        XCTAssertTrue(resultLabel.exists)
    }
    
    func testSingleWordReversing() throws {
        textField.tap()
        textField.typeText("Reverse")
        doneButton.tap()
        XCTAssertEqual(resultLabel.label, "esreveR")
        reverseButton.tap()
    }
    
    func testMultiWordsReversing() throws {
        textField.tap()
        textField.typeText("Reverse words")
        doneButton.tap()
        XCTAssertEqual(resultLabel.label, "esreveR sdrow")
        reverseButton.tap()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
