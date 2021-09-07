//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by Jevgenijs Jefrosinins on 03/09/2021.
//

import XCTest
@testable import Reverse_words

class ReverseWordsUITests: XCTestCase {

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
        
        let model = UITestsModel()
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        let button = app.buttons.element(matching: .button, identifier: model.buttonID)
        let textField = app.textFields.element(matching: .textField, identifier: model.textFieldID)

        XCTAssertTrue(textField.exists)
        XCTAssertTrue(button.exists)
        textField.tap()
        textField.typeText("Reverse")
        app.buttons["Done"].tap()
        button.tap()
        button.tap()
        
        textField.tap()
        textField.typeText("Reverse words")
        app.buttons["Done"].tap()
        button.tap()
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
