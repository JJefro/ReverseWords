//
//  ReverseWordsTests.swift
//  ReverseWordsTests
//
//  Created by Jevgenijs Jefrosinins on 03/09/2021.
//

import XCTest
@testable import Reverse_words

class ReverseWordsTests: XCTestCase {

    var sut: ReverseWordsService!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ReverseWordsService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let model = TestsModel()
   
        XCTAssertEqual(model.expectedOutput_1, sut.reverse(string: model.stringInput_1))
        XCTAssertEqual(model.expectedOutput_2, sut.reverse(string: model.stringInput_2))
        XCTAssertEqual(model.expectedOutput_3, sut.reverse(string: model.stringInput_3))
        XCTAssertEqual(model.expectedOutput_4, sut.reverse(string: model.stringInput_4))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
