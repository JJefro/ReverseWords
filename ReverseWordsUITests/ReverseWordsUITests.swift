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
    var resultButton: XCUIElement!
    var topTextField: XCUIElement!
    var bottomTextField: XCUIElement!
    var resultLabel: XCUIElement!
    var returnButton: XCUIElement!
    var segmentedControl: XCUIElement!
    var defalutButton: XCUIElement!
    var customButton: XCUIElement!
    var extraButton: XCUIElement!
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()
        
        self.resultButton = app.buttons[accessibilityIdentifier.resultButton]
        self.topTextField = app.textFields[accessibilityIdentifier.topTextField]
        self.bottomTextField = app.textFields[accessibilityIdentifier.bottomTextField]
        self.resultLabel = app.staticTexts.element(matching: .any, identifier: accessibilityIdentifier.resultLabel)
        self.returnButton = app.buttons[accessibilityIdentifier.returnButton]
        self.segmentedControl = app.segmentedControls[accessibilityIdentifier.segmentedControl]
        self.defalutButton = app.buttons[accessibilityIdentifier.defaultButton]
        self.customButton = app.buttons[accessibilityIdentifier.customButton]
        self.extraButton = app.buttons[accessibilityIdentifier.extraButton]
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testThePresenceOfElements() throws {
        XCTAssertTrue(topTextField.exists)
        XCTAssertTrue(resultButton.exists)
        XCTAssertTrue(segmentedControl.exists)
        XCTAssertTrue(defalutButton.exists)
        XCTAssertTrue(customButton.exists)
        XCTAssertTrue(extraButton.exists)
        topTextField.tap()
        topTextField.typeText("Corona")
        XCTAssertTrue(returnButton.exists)
        returnButton.tap()
        resultButton.tap()
        XCTAssertTrue(resultLabel.exists)
    }
    
    func testSingleWordReversing_withDefaultSettings() throws {
        topTextField.tap()
        topTextField.typeText("Reve12rse")
        returnButton.tap()
        resultButton.tap()
        XCTAssertEqual(resultLabel.label, "esre12veR")
        resultButton.tap()
        topTextField.tap()
        topTextField.typeText("a1bcd")
        returnButton.tap()
        resultButton.tap()
        XCTAssertEqual(resultLabel.label, "d1cba")
    }
    
    func testSingleWordReversing_withCustomSettings() throws {
        customButton.tap()
        topTextField.tap()
        topTextField.typeText("Reve12rse")
        returnButton.tap()
        bottomTextField.tap()
        bottomTextField.typeText("Re")
        returnButton.tap()
        resultButton.tap()
        XCTAssertEqual(resultLabel.label, "Reser21ve")
        resultButton.tap()
        extraButton.tap()
        topTextField.tap()
        topTextField.typeText("cool")
        bottomTextField.tap()
        bottomTextField.typeText("xl")
        XCTAssertEqual(resultLabel.label, "oocl")
    }
    
    func testMultiWordsReversing_withoutCustomSettings() throws {
        topTextField.tap()
        topTextField.typeText("Foxminded cool 24/7")
        returnButton.tap()
        resultButton.tap()
        XCTAssertEqual(resultLabel.label, "dednimxoF looc 24/7")
        resultButton.tap()
    }
    
    func testSingleWordReversing_withExtraSettings() throws {
        extraButton.tap()
        topTextField.tap()
        topTextField.typeText("Reverse")
        returnButton.tap()
        XCTAssertEqual(resultLabel.label, "esreveR")
        bottomTextField.tap()
        bottomTextField.typeText("Re")
        XCTAssertEqual(resultLabel.label, "Reserve")
    }
    
    func testMultiWordsReversing_withExtraSettings() throws {
        extraButton.tap()
        topTextField.tap()
        topTextField.typeText("Foxminded cool 24/7")
        returnButton.tap()
        XCTAssertEqual(resultLabel.label, "dednimxoF looc 7/42")
        bottomTextField.tap()
        bottomTextField.typeText("xl")
        returnButton.tap()
        XCTAssertEqual(resultLabel.label, "dexdnimoF oocl 7/42")
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
