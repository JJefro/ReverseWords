//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by Jevgenijs Jefrosinins on 03/09/2021.
//

import XCTest
@testable import Reverse_words

class ReverseWordsUITests: XCTestCase {
    
    let accessibility = UITestsAccessibility()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        XCUIApplication().launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {

        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        let button = app.buttons[accessibility.buttonID]
        let textField = app.textFields[accessibility.textFieldID]
        let result = app.staticTexts.element(matching: .any, identifier: accessibility.resultLabelID)
        let doneButton = app.buttons[accessibility.doneID]

        XCTAssertTrue(textField.exists)
        XCTAssertTrue(button.exists)
        
        textField.tap()
        textField.typeText("Reverse")
        doneButton.tap()
        
        XCTAssertTrue(result.exists)
        XCTAssertEqual(result.label, "esreveR")
        
        button.tap()

        textField.tap()
        textField.typeText("Reverse words")
        doneButton.tap()
        
        XCTAssertTrue(result.exists)
        XCTAssertEqual(result.label, "esreveR sdrow")
        
        button.tap()
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
