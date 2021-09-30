//
//  ReverseWordsTests.swift
//  ReverseWordsTests
//
//  Created by Jevgenijs Jefrosinins on 03/09/2021.
//

import XCTest
@testable import Reverse_words

class ReverseWordsTests: XCTestCase {

    var sut: ReverseWordsModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ReverseWordsModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testStringReverse_SingleWordReversing_WithoutIgnoringElements() throws {
        
        // This is an example of a functional test case.
        let singleWordInput1 = "Reve4rse34!"
        let expectedSingleWordOutput1 = "esre4veR34!"
        
        let singleWordInput2 = "a1bcd"
        let expectedSingleWordOutput2 = "d1cba"
        
        let singleWordInput3 = "efg!h"
        let expectedSingleWordOutput3 = "hgf!e"

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(expectedSingleWordOutput1, sut.reverse(string: singleWordInput1))
        XCTAssertEqual(expectedSingleWordOutput2, sut.reverse(string: singleWordInput2))
        XCTAssertEqual(expectedSingleWordOutput3, sut.reverse(string: singleWordInput3))
    }
    
    func testStringReverse_MultiWordsReversing_WithoutIgnoringElements() throws {
        
        // This is an example of a functional test case.
        let multiWordsInput1 = "Blackbird singing"
        let expectedMultiWordsOutput1 = "dribkcalB gnignis"
        
        let multiWordsInput2 = "You were only waiting for this moment to arise"
        let expectedMultiWordsOutput2 = "uoY erew ylno gnitiaw rof siht tnemom ot esira"
        
        let multiWordsInput3 = "Take these broken!!! wings and learn to fly"
        let expectedMultiWordsOutput3 = "ekaT eseht nekorb!!! sgniw dna nrael ot ylf"

        let multiWordsInput4 = "Foxminded cool 24/7"
        let expectedMultiWordsOutput4 = "dednimxoF looc 24/7"
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(expectedMultiWordsOutput1, sut.reverse(string: multiWordsInput1))
        XCTAssertEqual(expectedMultiWordsOutput2, sut.reverse(string: multiWordsInput2))
        XCTAssertEqual(expectedMultiWordsOutput3, sut.reverse(string: multiWordsInput3))
        XCTAssertEqual(expectedMultiWordsOutput4, sut.reverse(string: multiWordsInput4))
    }

    func testStringReverse_SingleWordReversing_WithCustomIgnoringElements() throws {
        sut.settings = .extraSettings
        sut.exceptionElements = "Re"

        let singleWordInput1 = "Reve4rse34!"
        let expectedSingleWordOutput1 = "Re!e43ser4v"

        let singleWordInput2 = "a1bcd"
        let expectedSingleWordOutput2 = "dcb1a"

        XCTAssertEqual(expectedSingleWordOutput1, sut.reverse(string: singleWordInput1))
        XCTAssertEqual(expectedSingleWordOutput2, sut.reverse(string: singleWordInput2))
    }

    func testStringReverse_MultiWordsReversing_WithCustomIgnoringElements() throws {
        sut.settings = .customSettings
        sut.exceptionElements = "xl"

        let multiWordsInput1 = "Foxminded cool 24/7"
        let expectedMultiWordsOutput1 = "dexdnimoF oocl 7/42"

        let multiWordsInput2 = "abcd efgh"
        let expectedMultiWordsOutput2 = "dcba hgfe"

        let multiWordsInput3 = "a1bcd efglh"
        let expectedMultiWordsOutput3 = "dcb1a hgfle"

        XCTAssertEqual(expectedMultiWordsOutput1, sut.reverse(string: multiWordsInput1))
        XCTAssertEqual(expectedMultiWordsOutput2, sut.reverse(string: multiWordsInput2))
        XCTAssertEqual(expectedMultiWordsOutput3, sut.reverse(string: multiWordsInput3))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
